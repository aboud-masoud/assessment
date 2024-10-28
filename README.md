# Exinity Assessment

This project is a sample application designed to display a real-time list of symbols and prices.

## Project Structure
The project is structured with clear separations for UI, Business Logic, Data, and Utility layers. Below is an overview of each component:

### Core Structure

The main project files are under the `lib` directory, organized as follows:

- **`model/`**: Contains model classes, structured to parse JSON responses from APIs or socket connections. These models are simplified for the current use case, focusing only on required fields.


- **`presentation/`**: Contains UI components for the application.
  - **`shared_widget/`**: Holds reusable widgets, accessible across various screens.
  - **`market/`**: The primary screen for displaying the list of symbols and prices. It includes:
    - **`bloc/`**: Manages business logic specific to this screen, using the Bloc pattern.

- **`services/`**: Serves as an intermediary between the Bloc layer and external services, such as API calls, socket communication, and network checks. This layer handles all third-party interactions.

- **`utils/`**: Contains utility functions for the application, supporting general-purpose tasks.

- **Main Files**:
  - **`app.dart`**: Controls the `MaterialApp` configuration.
  - **`locator.dart`**: Manages dependency injection, utilizing the `get_it` package.
  - **`main.dart`**: The application's entry point.


### Testing

The `test` folder includes subdirectories to ensure thorough testing coverage:

- **`bloc/`**: Contains tests for business logic using `bloc_test` and `mocktail`.
- **`service/`**: Tests interactions between Bloc and external services.
- **`widgets/`**: Tests for UI components using `flutter_bloc`, `flutter_test`, and `mocktail`, with BDD test coverage.


### Running the Project

To run the project, ensure that Flutter is installed on your machine. Clone the repository from GitHub, open it in your preferred IDE, and run the following command:

```bash
flutter run
```

### Running the UnitTest

To run the unit tests for this project, use the following command:

```bash
flutter test
```

### Dependencies

The `pubspec.yaml` file contains the following packages:

### Primary Dependencies

- **`get_it: 7.7.0`**: Used for dependency injection, to easily manage Bloc and service instances as singletons or factories.
- **`flutter_bloc: 8.1.6`**: Preferred state management solution for updating the UI based on Bloc state.
- **`web_socket_channel: ^3.0.1`**: Manages socket connections to retrieve real-time data.
- **`dio: 5.7.0`**: Handles API connections.
- **`cupertino_icons: ^1.0.8`**: Provides icons for the application.
- **`logger: ^2.4.0`**: Logs activity within the app.
- **`connectivity_plus: ^6.0.5`**: Monitors network connectivity.

### Development Dependencies

- **`flutter_test: ^2.2.0`**: Essential for running tests.
- **`json_serializable: ^6.8.0`**: Facilitates JSON serialization.
- **`freezed: ^2.5.7`**: Used for generating immutable classes, particularly for state and models.
- **`build_runner: ^2.4.13`**: Generates necessary files for serialization with `flutter pub run build_runner build --delete-conflicting-outputs`.
- **`bloc_test: 9.1.7`**: Used to test Bloc-based state management.
- **`mocktail: ^1.0.4`**: Supports data mocking for testing.


## Application Structure

This simplified structure enhances readability and maintainability for a small project. While this approach works well here, for larger applications, I recommend adding a UseCases layer to separate the service layer more distinctly from business logic.

Please note : this can be discussed in further in the next call , because there's is many idea for this structure and that always depend on the project size and team .

## Potential Enhancements:

1- Symbol Categorization: Organizing symbols returned from the API across different pages can improve the application’s efficiency. This enhancement will minimize the number of subscribe/unsubscribe actions with the hub, reducing server load and improving performance.



2- Handling Closed Markets: When the market is closed, the application should display the last known price along with an indicator to show that the market is closed. There are two approaches to achieve this:

- Client-Side Solution: Display the last known price directly on the mobile application. However, this approach is not recommended due to its dependency on the mobile app's local state and new users.

- Server-Side Solution: Implement caching, such as Redis, to store the last known prices. This approach allows the socket to deliver cached prices at the start, ensuring users see the last static price without experiencing loading delays when the market is closed. This method provides a more seamless user experience.
