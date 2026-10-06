# Lumina Auth – Flutter Login & Registration UI

A clean, modern Login and Registration interface for a mobile app, built with Flutter and Material 3 as a course assignment.

## Features

- **Login page**: app logo/name, email/username field, password field with show/hide toggle, Login button with loading state, "Forgot Password?" dialog, link to Registration
- **Registration page**: app logo/name, full name, email, password, confirm password, Create Account button, link back to Login
- Form validation with inline error messages (valid email format, password of 8+ characters with letters and numbers, matching passwords)
- Reusable widgets (`AuthTextField`, `AuthScaffold`) and validators to avoid duplicated code
- Responsive, scrollable layout that avoids overflow when the keyboard opens
- Material 3 theme with a consistent colour scheme

## Screenshots

<img width="772" height="612" alt="image" src="https://github.com/user-attachments/assets/dd60ac0d-39a8-4d5c-a14b-0500544ad4bc" />


## Technologies Used

- Flutter (Dart 3)
- Material 3 design
- `Form` / `TextFormField` validation, `Navigator` for page navigation

## Project Structure

```
lib/
├── main.dart                  # App entry point and theme
├── pages/
│   ├── login_page.dart
│   └── register_page.dart
├── widgets/
│   ├── auth_scaffold.dart     # Shared layout (logo, title, content)
│   └── auth_text_field.dart   # Reusable field with show/hide password
└── utils/
    └── validators.dart
```

## How to Run

1. Install [Flutter](https://docs.flutter.dev/get-started/install) and check with `flutter doctor`.
2. Clone the repository:
   ```bash
   git clone https://github.com/<your-username>/lumina-auth-flutter.git
   cd lumina-auth-flutter
   ```
3. If the `android/` or `ios/` folders are missing, generate them:
   ```bash
   flutter create .
   ```
4. Install dependencies and run:
   ```bash
   flutter pub get
   flutter run
   ```

## Notes

Authentication is simulated (no backend); successful validation shows a confirmation message.
