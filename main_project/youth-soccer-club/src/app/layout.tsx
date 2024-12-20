import type { Metadata } from "next";
import { Inter } from "next/font/google";
import Link from "next/link";
import { Suspense } from "react";
import { sendEmailPeriodic } from "./_util/sendEmail";
import "./globals.css";

const inter = Inter({ subsets: ["latin"] });

export const metadata: Metadata = {
  title: "Youth Soccer Club",
  description: "A simple app to view the database of a youth soccer club.",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en" className="overflow-y-scroll">
      <head>
        <meta name="darkreader-lock"></meta>
      </head>
      <body className={inter.className}>
        <div className={`flex min-h-screen flex-col items-center p-16`}>
          <Navbar />
          <Suspense fallback={null}>{children}</Suspense>
        </div>
      </body>
    </html>
  );
}

function Navbar() {
  return (
    <nav className="flex flex-col items-center gap-4 text-nowrap pb-12">
      <Link href="/">
        <h1 className="text-3xl font-bold text-white">Youth Soccer Club</h1>
      </Link>
      <div className="flex items-center gap-4 [&_a:hover]:bg-verdigris/25 [&_a:hover]:text-white [&_a]:rounded-lg [&_a]:bg-verdigris/15 [&_a]:px-2 [&_a]:py-1 [&_a]:text-xl [&_a]:text-gray-400 [&_a]:transition-all">
        <Link href="/query/1">Query 1-6</Link>
        <Link href="/query/7">Query 7</Link>
        <Link href="/query/8">Query 8</Link>
        <Link href="/query/9">Query 9</Link>
        <Link href="/query/10">Query 10</Link>
        <Link href="/query/11">Query 11</Link>
        <Link href="/query/12">Query 12</Link>
        <Link href="/query/13">Query 13</Link>
        <Link href="/query/14">Query 14</Link>
        <Link href="/query/15">Query 15</Link>
        <Link href="/query/16">Query 16</Link>
        <Link href="/query/17">Query 17</Link>
        <Link href="/query/18">Query 18</Link>
        <a>
          <form action={sendEmailPeriodic}>
            <button type="submit">Send Emails</button>
          </form>
        </a>
      </div>
    </nav>
  );
}
