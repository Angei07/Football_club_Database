"use server";

import { readFile } from "fs/promises";
import { RowDataPacket } from "mysql2";
import sql, { bulk } from "sql-template-tag";
import { getDb } from "./db";

interface SessionInfo extends RowDataPacket {
  ClubMemberName: string;
  ClubMemberRole: string;
  FamilyMemberName: string;
  LastName: string;
  FamilyMemberEmail: string;
  ScheduledDate: Date;
  TypeOfSession: string;
  HeadCoachName: string;
  HeadCoachEmail: string;
  LocationIDSender: number;
  Address: number;
}

async function sendEmail(s: SessionInfo) {
  const sessionTime = s.ScheduledDate.toUTCString().substring(0, 25);
  const emailSubject = `Montreal Youth Soccer Club Session at ${sessionTime}`;
  const emailBody = `${s.ClubMemberName} as a ${s.ClubMemberRole} with coach ${s.HeadCoachName}. It is a ${s.TypeOfSession} session at ${sessionTime} at ${s.Address}`;

  // TODO
  // await sendEmailTo(sessionInfo.FamilyMemberEmail, emailSubject, emailBody);

  return {
    locationIDSender: s.LocationIDSender,
    familyMemberEmail: s.FamilyMemberEmail,
    emailSubject,
    emailBody,
  };
}

export async function sendEmailPeriodic() {
  const emailQuery = await readFile("./sql/Email.sql", "utf8");

  const db = await getDb();

  try {
    console.log("Sending emails...");
    const [[sessionInfos]] = await db.query<[SessionInfo[], any]>(emailQuery);

    const emails = await Promise.all(
      sessionInfos.map(async (sessionInfo) => {
        return await sendEmail(sessionInfo);
      })
    );

    const insertQuery = sql`
    START TRANSACTION;
    INSERT INTO EmailLogs (LocationIDSender, EmailReceiver, EmailSubject, EmailBody)
    VALUES ${bulk(emails.map((email) => [email.locationIDSender, email.familyMemberEmail, email.emailSubject, email.emailBody]))};
    COMMIT;`;

    console.log("Inserting emails...", insertQuery.sql, insertQuery.values);

    await db.query(insertQuery.sql, insertQuery.values);

    console.log("Emails sent!");
  } catch (error: any) {
    await db.query("ROLLBACK");
    console.log("Emails not sent!", error);
    console.log();
    console.log(error.sqlMessage);
  }
}
