# FamPay Assignment
This repository contains the implementation of a Flutter application that displays a dynamic list of `Contextual Cards`. These cards are rendered using data fetched from an API and can adapt to changes in the backend. The project implements a standalone container for displaying these cards, adhering to the given design and functionality specifications.

## Features

- **Dynamic Card Rendering:** The application fetches and renders `Contextual Cards` dynamically based on the API response.
- **Plug-and-Play Component:** The container works independently and can be integrated into any screen/widget.
- **Card Actions:**
  - Handle deep links for cards, CTAs, and formatted text entities.
  - Long press on `Big Display Cards (HC3)` to reveal action buttons ("Remind Later" and "Dismiss Now").
    - "Remind Later" cards reappear on the next app start.
    - "Dismiss Now" cards are permanently removed.
- **Pull-to-Refresh:** Swipe down to refresh the card list.
- **Error and Loading States:** Handles loading and error states gracefully.
- **Reusable Components:** Structured code with flexible and reusable components for maintainability.

## API Reference

The application uses the following API to fetch contextual cards:

```
https://polyjuice.kong.fampay.co/mock/famapp/feed/home_section/?slugs=famx-paypage
```

### Card Schema

The API provides a list of card groups, each containing multiple cards with varying properties. Detailed schema and specifications for each card type are available in the [assignment document](https://www.figma.com/file/AvK2BRGwMTv4kQab5ymJ0K/AAL3-Android-assignment-Design-Specs).

## Installation

1. Clone the repository:
    ```bash
    git clone <repository_url>
    ```

2. Navigate to the project directory:
    ```bash
    cd contextual-cards-app
    ```

3. Get the required dependencies:
    ```bash
    flutter pub get
    ```

4. Run the application:
    ```bash
    flutter run
    ```

## Folder Structure

The project follows a clean and modular structure:

```
lib/
├── data/                       # Data layer
│   ├── repositories/           # Repository for API data
│   │   └── card_repository.dart
│   ├── service/                # Service layer for API handling
│   │   └── card_service.dart
│
├── domain/                     # Business logic layer
│   ├── big_card_cubit/         # State management for big cards
│   │   └── big_card_cubit.dart
│   ├── card_bloc/              # BLoC for card management (if used)
│   └── model/                  # Model classes
│       ├── card_model.dart
│       ├── hc1_model.dart
│       ├── hc3_model.dart
│       ├── hc5_model.dart
│       ├── hc6_model.dart
│       └── hc9_model.dart
│
├── presentation/               # UI layer
│   ├── cards/                  # Individual card widgets
│   │   ├── contextual_card.dart
│   │   ├── hc1_card.dart
│   │   ├── hc3_card.dart
│   │   ├── hc5_card.dart
│   │   ├── hc6_card.dart
│   │   └── hc9_card.dart
│   ├── utils/                  # Utility components (e.g., assets and helpers)
│   │   ├── assets.dart         # Asset management
│   │   └── utils.dart          # General utilities
│   └── card_view.dart          # Main container for contextual cards
│
└── main.dart                   # Application entry point
```

## How to Use

1. **Integration:** Add the `ContextualCardsContainer` widget to any screen or widget in your project.
    ```dart
    import 'package:your_project/presentation/card_view.dart';

    class YourScreen extends StatelessWidget {
      @override
      Widget build(BuildContext context) {
        return Scaffold(
          body: ContextualCardsContainer(),
        );
      }
    }
    ```

2. **Dynamic API Response:** The container will fetch and display cards based on the API response.

3. **Custom Actions:**
   - Long press on `HC3` cards for additional actions.
   - Tap on CTAs to trigger deep links.

## Demo

[![Watch the Demo]](https://youtube.com/shorts/z81xcYWFNU8?feature=share)

## Submission Details

- **APK:** Available in the `apk/` folder.
