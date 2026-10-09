# Christmas Together 2026 — Android app

[![Build Android app](https://github.com/Mplaystore/christmas-together-app/actions/workflows/android.yml/badge.svg)](https://github.com/Mplaystore/christmas-together-app/actions/workflows/android.yml)

Capacitor 8 wrapper around the Christmas Together web app (`www/index.html`).
App ID: `christmas.together` · Version 1.0.0

## What you need (Windows)
- Node.js 22 or newer
- Android Studio (latest), with an Android SDK installed

## 1. First-time setup
Double-click `setup-windows.bat`, or run in this folder:

```
npm install
npx cap add android
npx capacitor-assets generate --android
npx cap sync android
npx cap open android
```

This creates the `android/` folder, the app icons and splash screens (from `assets/`), and opens the project in Android Studio.

## 2. Test on a phone or emulator
In Android Studio, pick a device and press **Run ▶**.

## 3. After changing the app
Replace `www/index.html`, then run `npx cap sync android`.

## 4. Build the release file for Google Play
1. Android Studio → **Build › Generate Signed App Bundle or APK** → **Android App Bundle**.
2. Create a new keystore the first time. **Back up the .jks file and its passwords** — you need the same key for every future update.
3. Choose **release**. The `.aab` file is written to `android/app/release/`.
4. Upload the `.aab` in Google Play Console.

For each new upload, raise `versionCode` (1, 2, 3…) and `versionName` in `android/app/build.gradle`, and `appVersion` in `www/index.html`.

## Play Console checklist
- App icon 512×512: `assets/play-store-icon-512.png`
- Feature graphic 1024×500 and at least 2 phone screenshots
- Privacy policy URL (Play requires one)
- Data safety form: the app stores the user's data on the phone only
- Content rating questionnaire and target audience

## Automatic cloud build (no installs needed)
Every push to `main` builds the app on GitHub (Actions tab → "Build Android app"):
- **Test APK** (`christmas-together-test-apk-N`) — install on your phone to test.
- **Signed Play Store AAB** (`christmas-together-playstore-aab-N`) — built once the 4 signing secrets are added in Settings › Secrets and variables › Actions: `ANDROID_KEYSTORE_BASE64`, `ANDROID_KEYSTORE_PASSWORD`, `ANDROID_KEY_ALIAS`, `ANDROID_KEY_PASSWORD`.

The build number becomes the `versionCode` automatically; `versionName` comes from `package.json`. You can also start a build by hand with **Run workflow**.

## Store listing
- `store/play-store-listing.txt` — app name, short and full description
- `store/feature-graphic-1024x500.png` — Play Store feature graphic
- `store/app-icon-512.png` — Play Store app icon (512×512, 32-bit PNG)
- `store/screenshots/` — 7 phone screenshots (1080×1920)
- `PRIVACY.md` — privacy policy (also `docs/privacy.html` for GitHub Pages)

## Files
- `www/index.html` — the app
- `capacitor.config.json` — app ID, name, splash colours
- `assets/` — icon and splash sources
- `setup-windows.bat` — one-click setup
