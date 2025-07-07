# MomsBond Landing Page

A beautiful, responsive landing page for MomsBond - a mother-to-mother social platform built with Flutter using MVVM architecture.

## 🎯 About MomsBond

MomsBond is a revolutionary social platform designed specifically for mothers who want to connect on a deeper level. We understand that motherhood comes with unique challenges, joys, and experiences that only other mothers can truly understand.

## 🏗️ Architecture

This project follows the **MVVM (Model-View-ViewModel)** architecture pattern, which provides excellent separation of concerns and makes the codebase maintainable and testable.

### Project Structure

```
lib/
├── main.dart                 # App entry point
├── models/                   # Data models
│   ├── contact_form.dart
│   └── waitlist_form.dart
├── services/                 # Business logic and API calls
│   └── api_service.dart
├── viewmodels/              # ViewModels (business logic)
│   └── app_viewmodel.dart
└── views/                   # UI components
    ├── landing_page.dart    # Main landing page
    ├── sections/           # Page sections
    │   ├── hero_section.dart
    │   ├── about_section.dart
    │   ├── mission_section.dart
    │   ├── contact_section.dart
    │   └── waitlist_section.dart
    └── widgets/            # Reusable widgets
        └── footer_widget.dart
```

### MVVM Components

- **Models**: Data structures for forms and API responses
- **Views**: UI components that display data and handle user interactions
- **ViewModels**: Business logic layer that manages state and communicates with services
- **Services**: API calls and external integrations

## 🚀 Features

- **Responsive Design**: Works beautifully on all screen sizes
- **Modern UI**: Clean, professional design with smooth animations
- **Form Handling**: Contact and waitlist forms with validation
- **State Management**: Efficient state management using Provider
- **API Integration**: Ready for backend integration
- **Loading States**: Proper loading indicators and error handling

## 📱 Sections

1. **Hero Section**: Compelling headline with call-to-action buttons
2. **About Us**: Explains what MomsBond is and its features
3. **Our Mission**: Company vision and core values
4. **Contact Us**: Contact information and contact form
5. **Join Waitlist**: Benefits and signup form for early access
6. **Footer**: Company information and links

## 🛠️ Getting Started

### Prerequisites

- Flutter SDK (3.0.0 or higher)
- Dart SDK
- Android Studio / VS Code
- Git

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd moms_bond
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

### Configuration

1. **Update API endpoints** in `lib/services/api_service.dart`
2. **Customize colors and branding** in `lib/main.dart`
3. **Add your own images** to the `assets/images/` directory

## 🎨 Customization

### Colors
The app uses a pink-based color scheme that can be easily customized:

```dart
// Primary color
Color(0xFFE91E63) // Pink

// Secondary colors
Color(0xFFF8BBD9) // Light pink
Color(0xFF2D3748) // Dark gray
Color(0xFF4A5568) // Medium gray
```

### Typography
The app uses Google Fonts (Inter) which can be changed in `lib/main.dart`:

```dart
textTheme: GoogleFonts.interTextTheme(),
```

## 📦 Dependencies

- `provider`: State management
- `http`: API calls
- `shared_preferences`: Local storage
- `url_launcher`: External links
- `flutter_svg`: SVG support
- `google_fonts`: Typography

## 🔧 Development

### Adding New Sections

1. Create a new section widget in `lib/views/sections/`
2. Add it to the main landing page in `lib/views/landing_page.dart`
3. Update navigation if needed

### Adding New Features

1. Create models in `lib/models/`
2. Add business logic to `lib/viewmodels/app_viewmodel.dart`
3. Create UI components in `lib/views/`

## 🚀 Deployment

### Web Deployment
```bash
flutter build web
```

### Mobile Deployment
```bash
flutter build apk  # Android
flutter build ios  # iOS
```

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 📞 Support

For support, email hello@momsbond.com or create an issue in this repository.

---

**Made with ❤️ for moms everywhere** 