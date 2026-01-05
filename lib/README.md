# Clean Architecture in Flutter

This project is structured using a clean architecture approach, which separates the code into three main layers: `data`, `domain`, and `presentation`. This separation of concerns makes the code easier to test, maintain, and scale.

## Directory Structure

-   `lib/`
    -   `app/`: Contains app-level widgets and configurations, such as navigation and themes.
    -   `core/`: Contains code that is shared across multiple features, such as error handling, use case abstractions, and utility functions.
    -   `features/`: Each feature of your application (e.g., home, profile) has its own directory.
        -   `[feature_name]/`
            -   `data/`: The data layer is responsible for all data retrieval and manipulation.
                -   `datasources/`: Contains classes that retrieve data from a specific source (e.g., a REST API or a local database).
                -   `models/`: Contains data transfer objects (DTOs) that are used to transfer data between layers. These models often include methods for serialization and deserialization (e.g., `fromJson`, `toJson`).
                -   `repositories/`: Contains implementations of the repository interfaces defined in the domain layer. These classes are responsible for coordinating data from different data sources.
            -   `domain/`: The domain layer contains the core business logic of the application. It is independent of the other layers.
                -   `entities/`: Contains plain Dart objects that represent the core business models of your application.
                -   `repositories/`: Contains abstract repository interfaces that define the contract for the data layer.
                -   `usecases/`: Contains the business logic of the application. Each use case should have a single responsibility.
            -   `presentation/`: The presentation layer is what the user sees.
                -   `bloc/` or `provider/` or `cubit/`: Contains the state management logic for the feature.
                -   `screens/`: Contains the main widgets for each screen in the feature.
                -   `widgets/`: Contains smaller, reusable widgets that are used by the screens.
    -   `main.dart`: The entry point of the application.

## How to add a new feature

1.  Create a new directory in `lib/features` with the name of your feature (e.g., `lib/features/new_feature`).
2.  Create the `data`, `domain`, and `presentation` directories inside your new feature directory.
3.  Create the necessary subdirectories inside each layer (e.g., `datasources`, `models`, `repositories` in the `data` layer).
4.  Define your entities in `lib/features/new_feature/domain/entities`.
5.  Define your repository interface in `lib/features/new_feature/domain/repositories`.
6.  Implement your repository in `lib/features/new_feature/data/repositories`.
7.  Define your use cases in `lib/features/new_feature/domain/usecases`.
8.  Create your screens in `lib/features/new_feature/presentation/screens`.
9.  Implement your state management logic in `lib/features/new_feature/presentation/bloc` (or your preferred state management solution).
10. Add the new screen to the navigation in `lib/app/navigation/bottom_navigation.dart`.
