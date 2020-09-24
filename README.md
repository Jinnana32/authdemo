# Auth Demo using Auth0

A simple weather application that shows the user's current coordinates and a forecast of the current weather.

## Getting Started

Clone the repository using: https://github.com/Jinnana32/authdemo.git

After cloning, run `flutter pub get` to download the dependencies on the `pubspec.yaml` file.

Before running, check connected devices with `flutter devices`.
Then `flutter run` to run on the current available device  or `flutter run -d "device id"` for a specific device.

## Tools and libraries

1. `http` (https://pub.dev/packages/http) - used for API consumption
2. `flutter_appauth` (https://pub.dev/packages?q=flutter_appauth) - Provides a connection interface between flutter and Auth0
3. `flutter_secure_storage ` (https://pub.dev/packages/flutter_secure_storage) - easy access to device localstorage
4. `geolocator` (https://pub.dev/packages/geolocator) - provides access to platform specific location services
5. `jiffy` (https://pub.dev/packages/jiffy) - Parsing and manipulating date
6. `flutter_bloc` (https://pub.dev/packages/flutter_bloc) - For easy implementation of flutter's Bloc Pattern

## API's

1. `Auth0` (https://auth0.com)
2. `openweathermap.org` (https://openweathermap.org)
