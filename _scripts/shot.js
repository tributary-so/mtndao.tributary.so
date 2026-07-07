const { chromium } = require("/tmp/node_modules/playwright-core");
(async () => {
  const browser = await chromium.launch({
    executablePath:
      "/home/xeroc/.cache/ms-playwright/chromium-1228/chrome-linux64/chrome",
    args: ["--no-sandbox"],
  });
  const page = await browser.newPage({
    viewport: { width: 1440, height: 2200 },
    deviceScaleFactor: 1,
  });
  await page.goto("http://127.0.0.1:4011/", { waitUntil: "networkidle" });
  await page.waitForTimeout(800);
  await page.screenshot({ path: "_site/shot-home-top.png", fullPage: false });
  // full page
  await page.screenshot({ path: "_site/shot-home-full.png", fullPage: true });
  // a use-case detail page
  await page.goto("http://127.0.0.1:4011/use-cases/ai-companions/", {
    waitUntil: "networkidle",
  });
  await page.waitForTimeout(500);
  await page.screenshot({ path: "_site/shot-detail.png", fullPage: false });
  // mobile
  await page.setViewportSize({ width: 390, height: 1600 });
  await page.goto("http://127.0.0.1:4011/", { waitUntil: "networkidle" });
  await page.waitForTimeout(500);
  await page.screenshot({ path: "_site/shot-mobile.png", fullPage: false });
  await browser.close();
  console.log("screenshots done");
})().catch((e) => {
  console.error(e);
  process.exit(1);
});
