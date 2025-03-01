# Strichpunkt

Strichpunkt is a modern Flutter application that focuses on user profile management. The name "Strichpunkt" is German for "semicolon," symbolizing the connection between users and their digital identities.

## Features

- **User Profile Management**: View and manage user profiles
- **Clean Architecture**: Organized with a feature-first approach using Domain, Data, and Presentation layers
- **State Management**: Utilizes BLoC/Cubit pattern for efficient state management
- **Responsive Design**: Adapts to different screen sizes with Flutter ScreenUtil
- **Navigation**: Uses Auto Route for type-safe routing

## Project Structure

The project follows a clean architecture approach with a feature-first organization:

```
lib/
├── core/           # Core functionality, utilities, and shared components
├── features/       # Feature modules
│   └── user_profiles/  # User profile feature
│       ├── data/       # Data layer (repositories, data sources)
│       ├── domain/     # Domain layer (entities, use cases)
│       └── presentation/ # UI layer (pages, widgets, cubits)
└── main.dart       # Application entry point
```

## Technology Stack

- **Flutter SDK**: ^3.7.0
- **State Management**: flutter_bloc, bloc, equatable
- **Dependency Injection**: get_it
- **Routing**: auto_route
- **Network**: http
- **Storage**: shared_preferences
- **UI Components**: flutter_svg, flutter_screenutil, custom_refresh_indicator, skeletonizer

## Getting Started

### Prerequisites

- Flutter SDK (^3.7.0)
- Dart SDK (^3.7.0)
- Android Studio / VS Code with Flutter extensions

### Installation

1. Clone the repository:
   ```
   git clone https://github.com/yourusername/strichpunkt.git
   ```

2. Navigate to the project directory:
   ```
   cd strichpunkt
   ```

3. Install dependencies:
   ```
   flutter pub get
   ```

4. Run the application:
   ```
   flutter run
   ```

## Development

### Code Generation

The project uses code generation for routes and other boilerplate code:

```
flutter pub run build_runner build --delete-conflicting-outputs
```

### Testing

Run tests with:

```
flutter test
```

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments

- Flutter team for the amazing framework
- All the package authors that made this project possible
