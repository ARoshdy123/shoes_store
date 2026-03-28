# Doctor

Flutter application for discovering doctors, booking appointments, managing profile data, and viewing medical-record PDFs. The codebase also contains Athir-branded assets and copy, so final product branding should be confirmed before public release.

<p align="center">
  <img src="assets/svgs/athir_logo.svg" width="180" alt="App logo" />
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-app-blue?logo=flutter" alt="Flutter"/>
  <img src="https://img.shields.io/badge/Dart-3.7%2B-blue?logo=dart" alt="Dart"/>
  <img src="https://img.shields.io/badge/State-Cubit%20%2F%20BLoC-purple" alt="Cubit / BLoC"/>
  <img src="https://img.shields.io/badge/Networking-Dio%20%2B%20Retrofit-green" alt="Dio and Retrofit"/>
</p>

## Features

- Onboarding flow that leads users into authentication.
- Email/password login and sign-up with form validation.
- Optional "Remember me" support backed by local storage.
- Biometric login using `local_auth` after credentials have been saved.
- Home dashboard with doctor specializations, doctor recommendations, and promotional banners.
- Doctor exploration with debounced search and specialization-based filtering.
- Doctor detail view with About, Location, and Reviews tabs.
- Appointment booking flow with date/time selection, payment selection, and summary/confirmation screens.
- Appointment management with Upcoming, Completed, and Cancelled tabs plus rescheduling screens.
- Profile retrieval, update flow, avatar image picking, and logout.
- Medical ID image upload stored locally on the device.
- Medical records section with bundled PDF viewing and file download support.
- External deep links to Google Maps for doctor and offer locations.

## Screenshots

Repository screenshots were not clearly provided.

| Screen | Status |
| --- | --- |
| Onboarding | TODO: add screenshot |
| Login / Sign Up | TODO: add screenshot |
| Home | TODO: add screenshot |
| Explore / Doctor Details | TODO: add screenshot |
| Booking Flow | TODO: add screenshot |
| My Appointments | TODO: add screenshot |
| Profile / Medical Records | TODO: add screenshot |

## Platform Support

| Platform | Status from repository |
| --- | --- |
| Android | Configured in the repository. Product flavors are defined in Gradle. |
| iOS | Runner and permissions are configured. |
| macOS | Runner exists in the repository. |
| Windows | Runner exists in the repository. |
| Linux | Runner exists in the repository. |
| Web | Web scaffolding exists, but the app is not currently web-ready because app code imports `dart:io` in multiple runtime paths. |

## Tech Stack

| Area | Implementation |
| --- | --- |
| Framework | Flutter |
| Language | Dart (`sdk: ^3.7.0`) |
| State management | `flutter_bloc` with Cubits |
| Dependency injection | `get_it` |
| Networking | `dio`, `retrofit`, `pretty_dio_logger` |
| Models / codegen | `json_serializable`, `json_annotation`, `freezed`, `build_runner` |
| Local storage | `shared_preferences`, `flutter_secure_storage` |
| Biometrics | `local_auth` |
| UI / responsiveness | `flutter_screenutil`, `flutter_svg`, `shimmer`, `google_nav_bar`, `easy_date_timeline` |
| Media / files | `image_picker`, `pdfrx`, `path_provider`, `permission_handler`, `url_launcher` |
| Splash screen | `flutter_native_splash` |

## Architecture

The app follows a feature-first structure with clear separation between:

- `data`: Retrofit services, models, and repositories
- `logic`: Cubits and immutable states
- `ui`: screens and feature widgets
- `core`: shared helpers, routing, networking, theming, dependency injection, and reusable widgets

State is managed with Cubits, and dependencies are registered centrally through `GetIt`.

## Project Structure

```text
lib/
  core/
    di/                  # GetIt registration
    helpers/             # constants, validators, extensions, responsive helpers
    networking/          # Dio factory, API constants, API result/error handling
    routing/             # route names and route generation
    services/            # download service
    theming/             # colors, text styles, font helpers
    widgets/             # shared form/button widgets
  features/
    onboarding/
    login/
    sign_up/
    main_layout/
    home/
    explore/
    booking/
    my_appointments/
    profile/
    medical_records/
    offers/
  doc_app.dart
  main_development.dart
  main_production.dart
assets/
  fonts/
  images/
  pdf/
  svgs/
android/
ios/
macos/
windows/
linux/
web/
```

Typical feature layout:

```text
features/<feature>/
  data/
    data_sources/
    models/
    repos/
  logic/
    cubit/              # some features place Cubits directly under logic/
  ui/
    widgets/
```

## Backend Integration

The app talks to a REST backend through Dio + Retrofit. The base URL is hardcoded in `lib/core/networking/api_constants.dart`:

```text
https://vcare.integration25.com/api/
```

Implemented API calls found in the repository:

| Endpoint | Method | Used for |
| --- | --- | --- |
| `auth/login` | `POST` | User login |
| `auth/register` | `POST` | User registration |
| `auth/logout` | `POST` | User logout |
| `user/profile` | `GET` | Fetch profile |
| `user/update` | `POST` | Update profile |
| `specialization/index` | `GET` | Home and explore specializations |
| `doctor/index` | `GET` | Doctor listing |
| `doctor/doctor-search` | `GET` | Search doctors by name |
| `doctor/doctor-filter` | `GET` | Filter doctors by specialization |
| `appointment/store` | `POST` | Create appointment |
| `appointment/index` | `GET` | Fetch appointments |

Not everything is backend-driven yet:

- Home banner offers use local mock data.
- Offer details are currently local/mock and include a TODO for booking API integration.
- Medical records currently read bundled PDFs from `assets/pdf/`.

## Authentication Flow

- Onboarding navigates to the login screen.
- Users can log in or create an account.
- On successful login, the bearer token is stored in secure storage and injected into Dio headers.
- "Remember me" stores the email in shared preferences and the password in secure storage.
- Fingerprint / biometric login reuses saved credentials and then performs the standard login request.
- Logout calls the backend logout endpoint and clears the stored token.

## Theming and Localization

### Theming

- The app uses a custom color palette and typography helpers under `lib/core/theming/`.
- Poppins is configured as the app font family.
- `MaterialApp` currently defines a single light theme.
- No dark theme configuration was found.

### Localization

- The dependency `easy_localization` is present in `pubspec.yaml`.
- No localization assets, `EasyLocalization` wrapper, or configured supported locales were found in the app bootstrap.
- Current UI copy appears to be hard-coded in English.

## Getting Started

### Prerequisites

- Flutter SDK compatible with Dart `^3.7.0`
- Dart SDK compatible with the Flutter version above
- Android Studio or VS Code with Flutter tooling
- Platform toolchains as needed:
  - Android SDK for Android builds
  - Xcode for iOS/macOS builds
  - Visual Studio C++ workload for Windows builds
  - Linux desktop toolchain for Linux builds

### Installation

```bash
git clone <your-repository-url>
cd doc_app
flutter pub get
```

If you modify Retrofit, Freezed, or JSON-serializable models, regenerate code with:

```bash
dart run build_runner build --delete-conflicting-outputs
```

If you update splash assets or splash settings, regenerate the native splash:

```bash
dart run flutter_native_splash:create
```

### Run

Android flavors are configured in `android/app/build.gradle.kts`.

```bash
# Android - development
flutter run --flavor development -t lib/main_development.dart

# Android - production
flutter run --flavor production -t lib/main_production.dart
```

For non-Android targets, the repository includes standard Flutter runners and both entrypoints currently bootstrap the same app:

```bash
# iOS
flutter run -d ios -t lib/main_production.dart

# macOS
flutter run -d macos -t lib/main_production.dart

# Windows
flutter run -d windows -t lib/main_production.dart

# Linux
flutter run -d linux -t lib/main_production.dart
```

## Build

### Android

```bash
# APK
flutter build apk --flavor development -t lib/main_development.dart
flutter build apk --flavor production -t lib/main_production.dart

# App Bundle
flutter build appbundle --flavor production -t lib/main_production.dart
```

### iOS

```bash
flutter build ios -t lib/main_production.dart
```

### Desktop runners present in the repo

```bash
flutter build macos -t lib/main_production.dart
flutter build windows -t lib/main_production.dart
flutter build linux -t lib/main_production.dart
```

### Web

No web build command is documented here because the current app code imports `dart:io` in runtime features such as profile image handling and the download service. Web support would need refactoring before it can be considered build-ready.

## Configuration

No `.env`, Firebase configuration, or `--dart-define` based environment setup was found in the repository.

Current configuration points worth knowing:

- API base URL is hardcoded in `lib/core/networking/api_constants.dart`.
- Android product flavors:
  - `development`: app name `Doctor Development`, application ID suffix `.development`
  - `production`: app name `Doctor`, application ID suffix `.production`
- `lib/main_development.dart` and `lib/main_production.dart` are currently identical.
- Native splash screen config is defined in `flutter_native_splash.yaml`.
- Android permissions include internet, biometrics, and legacy storage permissions for file downloads.
- iOS `Info.plist` includes Face ID usage text plus file-sharing/document-opening flags for downloaded files.

## Testing

No project test suite was found under a root `test/` directory.

Useful commands:

```bash
# Static analysis
flutter analyze

# Run tests after adding them
flutter test
```

## Linting and Formatting

The project uses `flutter_lints` via `analysis_options.yaml`.

```bash
flutter analyze
dart format .
```

## Deployment Notes

No CI/CD workflows, release automation, or store deployment scripts were found in the repository.

Current release caveats from the codebase:

- Android release builds are still configured to use the debug signing config in `android/app/build.gradle.kts`.
- iOS/macOS signing and provisioning are not documented in the repository.
- Web deployment is not currently ready because of `dart:io` usage in app code.

## Contributing

1. Create a branch for your change.
2. Make the required code updates.
3. Run code generation if you changed generated models or API services.
4. Run formatting and analysis before opening a pull request.
5. Include screenshots for UI changes where relevant.

## License

No license file was found in the repository, so the project license is not yet specified.

## Information Still Needed

- [ ] Final product name and branding decision (`Doctor`, `Doc App`, and `Athir` all appear in the repository)
- [ ] Official screenshots or demo assets
- [ ] Confirmed release target platforms beyond the available Flutter runners
- [ ] Environment strategy if separate staging/production backends are required
- [ ] Release signing/provisioning setup for Android and iOS
- [ ] Project license
