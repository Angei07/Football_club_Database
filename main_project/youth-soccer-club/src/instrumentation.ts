export async function register() {
  if (process.env.NEXT_RUNTIME === "nodejs") {
    console.log("Instrumentation register...");

    if (process.env.SEED === "true") {
      console.log("Seeding database...");
      const { seed } = await import("@/app/_util/seed");
      await seed();
    }

    const { sendEmailPeriodic } = await import("@/app/_util/sendEmail");
    const cron = await import("node-cron");
    cron.schedule("0 12 * * 0", sendEmailPeriodic);
  }
}
