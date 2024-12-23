"use server";

import { seed } from "@/app/_util/seed";

export async function createTables() {
  try {
    await seed();
    return { status: true };
  } catch (err: any) {
    console.error(err);
    return { status: false, message: err.sqlMessage };
  }
}
