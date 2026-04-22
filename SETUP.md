# 🎉 Welcome to Flutter Init (Feature-first, Riverpod, Firebase, Go-router, Dio)!

This project was generated dynamically based on your specific requirements. Before running your app for the first time, follow this brief setup guide to configure the required environment variables, permissions, and dependencies locally.

---

## 1. 📦 Initial Dependencies & Generation

First, fetch all pub packages:
```bash
flutter pub get
```

### Code Generation
Your stack relies on code generation (Firebase, etc.). Run the following command right away to generate the necessary files:
```bash
dart run build_runner build --delete-conflicting-outputs
```

### Localization
Since you chose to include `easy_localization`, run these commands whenever you add or modify string translations to generate your keys correctly:
```bash
flutter pub run easy_localization:generate -S assets/translations -O lib/src/core/i18n -o locale_keys.g.dart
```

---

## 2. 🎨 Native Splash Screen Setup

This project uses `flutter_native_splash`.

**To apply your custom app launch screen:**
1. Place your transparent splash logo at [`assets/images/splash.png`](assets/images/splash.png).
2. Open [`flutter_native_splash.yaml`](flutter_native_splash.yaml) in the root of your project.
3. Uncomment the `image:` paths so it looks like:
   ```yaml
   flutter_native_splash:
     color: "##5e24ff"
     image: assets/images/splash.png
     android_12:
       image: assets/images/splash.png
       icon_background_color: "##5e24ff"
   ```
4. Apply the native configuration natively by running:
```bash
dart run flutter_native_splash:create --path=flutter_native_splash.yaml
```
*Note: Run this command every time you change your splash image or background color.*

---

## 3. 🔐 App Permissions (Android & iOS)

Based on your chosen flags (e.g. Image Picker  ), you must configure Native permissions before testing these features.

### Android Setup
Open [`android/app/src/main/AndroidManifest.xml`](android/app/src/main/AndroidManifest.xml) and add the following required permissions inside the `<manifest>` tag, directly above the `<application>` block:

```xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android">
    <!-- Internet is standard and required -->
    <uses-permission android:name="android.permission.INTERNET" />
    
    <!-- Required for image_picker -->
    <uses-permission android:name="android.permission.CAMERA" />
    <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" android:maxSdkVersion="32" />
    <uses-permission android:name="android.permission.READ_MEDIA_IMAGES" /> <!-- Android 13+ -->
```

### iOS Setup 
First, describe why you need permissions. Open [`ios/Runner/Info.plist`](ios/Runner/Info.plist) and add the following inside the main `<dict>` block:

```xml
<dict>
    ...
    <!-- Required for image_picker -->
    <key>NSCameraUsageDescription</key>
    <string>This app requires access to the camera to take profile photos.</string>
    <key>NSPhotoLibraryUsageDescription</key>
    <string>This app requires access to the photo library to upload images.</string>
</dict>
```

**IMPORTANT: Podfile Configuration**
Since you've enabled `permission_handler`, you **MUST** configure your requested iOS permissions using Podfile macros to comply with App Store rules. 

Open [`ios/Podfile`](ios/Podfile), find the `post_install` block at the bottom, and replace it completely with this snippet:

```ruby
post_install do |installer|
  installer.pods_project.targets.each do |target|
    flutter_additional_ios_build_settings(target)

    target.build_configurations.each do |config|
      config.build_settings['GCC_PREPROCESSOR_DEFINITIONS'] ||= [
        '$(inherited)',

        ## dart: PermissionGroup.camera
        'PERMISSION_CAMERA=1',

        ## dart: PermissionGroup.photos
        'PERMISSION_PHOTOS=1',

        ## dart: PermissionGroup.location
        'PERMISSION_LOCATION=0',
        'PERMISSION_LOCATION_WHENINUSE=0',

        ## dart: PermissionGroup.mediaLibrary
        'PERMISSION_MEDIA_LIBRARY=0',

        ## dart: PermissionGroup.microphone (Usually 1 if video recording is active with image_picker)
        'PERMISSION_MICROPHONE=1',

        ## Unused permissions forcefully disabled to avoid App Store Rejection
        'PERMISSION_EVENTS=0',
        'PERMISSION_EVENTS_FULL_ACCESS=0',
        'PERMISSION_REMINDERS=0',
        'PERMISSION_CONTACTS=0',
        'PERMISSION_SPEECH_RECOGNIZER=0',
        'PERMISSION_NOTIFICATIONS=0',
        'PERMISSION_SENSORS=0',
        'PERMISSION_BLUETOOTH=0',
        'PERMISSION_APP_TRACKING_TRANSPARENCY=0',
        'PERMISSION_CRITICAL_ALERTS=0',
        'PERMISSION_ASSISTANT=0',
      ]
    end
  end
end
```

---

## 4. 🌍 Environment Variables

Your project relies on `flutter_dotenv` to load secrets. 

1. Create a [`.env`](.env) file in the project root folder.
2. Insert your required variables (e.g. `API_URL=https://api.example.com`).
3. These keys are now accessible in Dart via `dotenv.env['API_URL']`.

---

## 5. 💾 Local Storage (Hive)

*(No local storage (Hive) selected for this project)*

---

## 6. ☁️ Backend Connections

You chose **Firebase** as your backend architecture.

**Initialize Firebase natively:**
1. Ensure the [Firebase CLI](https://firebase.google.com/docs/cli) is installed and logged in (`firebase login`).
2. Run the secure configuration tool:
```bash
dart pub global activate flutterfire_cli
flutterfire configure
```
3. This generates `lib/firebase_options.dart`. Your integration is already set up in `lib/src/app.dart` or `lib/main.dart` to securely initialize using this file!

---

## 7. 🚀 Running the App

Once everything above is verified:

1. **For iOS Simulators/Devices**, map your native pods locally:
```bash
cd ios
pod install
cd ..
```

2. Run your app via VS Code, Android Studio, or CLI:
```bash
flutter run
```

Congratulations, and happy coding!
git 