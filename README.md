# Reels App

A Flutter-based reels app that fetches and displays videos from an API with pagination, lazy loading, and caching.

## Key Features

- Fetch and display videos from API: `https://api.ulearna.com/bytes/all`.
- Pagination for smooth scrolling through large datasets.
- Lazy loading for improved performance.
- Video caching using Hive to reduce repeated API requests.
- Error handling for API failures.

## Installation

1. Clone the repository.
2. Run `flutter pub get` to install dependencies.
3. Use `flutter run` to launch the app on a connected device.

## Requirements

- Flutter SDK
- API for fetching video content
- Hive for data caching
- BLoC for state management

## Usage

1. Launch the app.
2. Scroll through videos fetched from the API.
3. Videos load and play automatically as you scroll.

## Dependencies

- `http`
- `flutter_bloc`
- `video_player`
- `hive`
- `hive_flutter`

