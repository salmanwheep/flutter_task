# My Software Design Choices for the Flutter Delivery App

Here's a breakdown of the key design choices I made for this application.

## 1. Architecture: MVVM (Model-View-ViewModel)


## 2. State Management: Provider

For state management, I went with the `provider` package. It's a straightforward and powerful solution that's popular in the Flutter community.

*   I use **`ChangeNotifierProvider`** to make my `ViewModel` instances available to the widget tree.
*   My ViewModels use **`ChangeNotifier`** (or `Listenable`) to let the View know when the state has changed, so the UI can rebuild itself automatically.
*   This way, I don't have to manually pass state down through many layers of widgets.

## 3. Data Handling: Repository Pattern

I used the Repository pattern to handle the data sources. The ViewModel talks to a `Repository`, and the repository figures out whether to get the data from the remote API or the local database.

*   **Remote Data**: I use the `http` package for making network requests to the backend.
*   **Local Data**: For offline support, I use `sqflite` to create a local SQLite database. This caches the order data, so the user can still see their orders even if they're offline.


## 4. Session Management

To improve security, I built a custom session expiration feature.

*   It's implemented using a `Timer` and a `WidgetsBindingObserver`.
*   If the user doesn't interact with the app for 2 minutes (or if the app is in the background), the timer fires and logs the user out, sending them back to the login screen.
*   Any user interaction (like a tap) or bringing the app back to the foreground resets the timer.
