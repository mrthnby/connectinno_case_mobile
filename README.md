### Connectinno Case Mobile

Production-ready Flutter application with clean architecture, DI, localization, Firebase, local persistence (ObjectBox), and a typed networking layer using Dio.

---

## Prerequisites

- Flutter SDK (Dart >= 3.8.1)
- Xcode (iOS) and/or Android Studio (Android)
- CocoaPods (for iOS)
- Java 17 (Android Gradle)
- Firebase project (iOS `GoogleService-Info.plist`, Android `google-services.json`)

---

## Quick Start

1) Install dependencies
```bash
flutter pub get
```

2) Generate code (Freezed, Injectable, GoRouter, Assets, ObjectBox, i18n keys)
```bash
bash scripts/localization.sh
bash scripts/build_runner.sh
```

3) Configure Firebase
- iOS: place `ios/Runner/GoogleService-Info.plist`
- Android: place `android/app/google-services.json`

4) Run the app
```bash
flutter run -d ios
flutter run -d android
```

---

## API Configuration

- Base API URL is centralized in `lib/core/constants/app_constants.dart`.
- Dio is configured with this base URL in `lib/core/clients/clients.dart` and used by `NetworkClientImpl`.

Update the base URL to point to your backend:
```dart
// lib/core/constants/app_constants.dart
abstract class AppConstants {
  static const String apiBaseUrl = 'http://localhost:8000'; // change here
}
```

The `NetworkClientImpl` composes requests using Dio and logs requests/responses:
```dart
// lib/core/clients/network/network_client_impl.dart
final response = await _dio.get<T>(url, queryParameters: queryParameters, options: Options(headers: headers));
```

Be sure your backend is running at the URL set in `AppConstants.apiBaseUrl`. 

---

## Architecture

The project follows a feature-first Clean Architecture with three layers per feature:

- Domain: pure business logic
  - Entities, Repositories (contracts), UseCases
- Data: framework-dependent implementations
  - Models, DataSources (remote/local), Repository implementations
- Presentation: UI and state management
  - Pages, Widgets, Bloc/Cubit controllers

Example: `lib/features/home/`
- `domain/` → `entities/note_entity.dart`, `usecases/*`, `repositories/home_repository.dart`
- `data/` → `models/note_model.dart`, `datasources/*`, `repositories/home_repository_impl.dart`
- `presentation/` → `pages/*`, `widgets/*`, `controllers/home_bloc.dart`

Cross-cutting concerns under `lib/core/`:
- `clients/` → `network` (Dio, paths, exceptions), `auth` (FirebaseAuth), `db` (ObjectBox), `logger`
- `di/` → Injectable/GetIt setup (`injection.dart`, generated `injection.config.dart`)
- `router/` → GoRouter config and generated routes
- `theme/` → app theme
- `constants/` → app-wide constants including API base URL, timeouts, regex
- `shared/` and `error/` → shared utilities and error types

Dependency Injection:
- Defined in `lib/core/clients/clients.dart` and wired via `@module`/`@injectable`
- Initialize in `bootstrap.dart` using `configureDependencies()`

State Management:
- `flutter_bloc` in presentation controllers

Localization:
- `easy_localization` with assets in `assets/translations/` and generated keys in `lib/gen/locale_keys.g.dart`

Persistence:
- ObjectBox initialized in `LocalDatabaseClientImpl` and `ObjectBox.create()`

---


## Scripts

- Generate i18n keys: `bash scripts/localization.sh`
- Run codegen in watch mode: `bash scripts/build_runner.sh`
- Generate a new feature skeleton: `bash scripts/generate_feature.sh <feature_name>`

Make scripts executable once:
```bash
chmod +x scripts/*.sh
```

---

## Running & Building

Run:
```bash
flutter run -d ios   # iOS Simulator
flutter run -d android
```

Build release:
```bash
flutter build ios --release
flutter build apk --release
```

