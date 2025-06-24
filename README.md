# Xgenious Task - Flutter Project

This Flutter application is structured using feature-based architecture and follows best practices for modularity, readability, and maintainability.

## 📁 Project Structure

```
lib/
├── app/                     # Global app configuration (e.g., themes, constants)
├── features/
│   └── home/
│       ├── data/            # Data layer for home feature
│       │   └── models/      # Data models for API responses
│       └── ui/              # UI layer
│           ├── screens/     # Main screens for the Home feature
│           └── widgets/     # Reusable UI components
├── services/                # Network and API services
└── main.dart                # App entry point

assets/
├── fonts/                   # Custom fonts
└── images/                  # App images and icons
```

## 🔧 Features

- **Home Page**: Includes categories, featured services, providers, and slider banners.
- **Clean Architecture**: Separation of data, UI, and services.
- **GetX State Management**: Efficient state and dependency management.
- **API Integration**: Fetches dynamic content from the ProHandy API.

## 📦 Dependencies

Make sure to add the following dependencies in your `pubspec.yaml`:

```yaml
dependencies:
   http:
   get:
   cached_network_image:
   carousel_slider: ^5.1.1
   flutter_svg: ^2.2.0
   stylish_bottom_bar: ^1.1.1
```

## 🚀 Getting Started

1. Clone the repository
2. Run `flutter pub get`
3. Connect your emulator or device
4. Run the app:  
   ```bash
   flutter run
   ```

## 🌐 API Endpoints

- Featured Services: https://prohandy.xgenious.com/api/v1/service/featured
- Provider List: https://prohandy.xgenious.com/api/v1/provider-lists
- Slider List: https://prohandy.xgenious.com/api/v1/slider-lists
- Categories: https://prohandy.xgenious.com/api/v1/categories

