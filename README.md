# Stock Chart Application

## Overview

This `README.md` file provides a comprehensive overview of the project, including its features,
directory structure, workflow, and instructions for setting up and running the project. 

This application displays a stock chart with various time intervals (Min, Hourly, Daily, Monthly, Yearly)
using the Bloc architecture. It features an interactive line chart that displays real-time stock
data fetched from a mock API. Users can interact with the chart using touch gestures to see detailed
information, zoom in, and pan.

## Features

- Bloc architecture for state management.
- Interactive line chart using the `fl_chart` package.
- Real-time data fetching from a mock API.
- Support for multiple time intervals (Min, Hourly, Daily, Monthly, Yearly).
- Smooth transitions and updates between different time intervals.
- Responsive and modern UI design.
- Optimized performance for smooth chart rendering and data updates.
- Display of essential stock information such as current price, price change, and percentage change.

## Project Structure
lib/
|-- blocs/
|   |-- stock_bloc.dart
|   |-- stock_event.dart
|   |-- stock_state.dart
|
|-- models/
|   |-- share_data_model.dart
|
|-- repositories/
|   |-- share_data_repo.dart
|
|-- screens/
|   |-- home_page.dart
|
|-- main.dart
|
test/
|-- blocs/
|   |-- stock_bloc_test.dart
|-- repositories/
|   |-- stock_repository_test.dart
### WorkFlow

- Bloc
    - StockEvent: Defines the events related to stock data, such as fetching data for different time
      intervals.
    - StockState: Defines the states of the stock data, such as loading, loaded, and error states.
    - StockBloc: Handles the business logic of fetching data from the repository and updating the
      state accordingly.
- Models
    - ShareDataModel: Defines the model for stock data, including fields such as time, price, and
      other relevant information.
- Repositories
    - DataShareRepo: Handles the data fetching from the mock API and provides methods to fetch data
      for different time intervals.
    - Screens
        - HomeScreen:The main screen of the application, which displays the stock chart and allows
          the user to switch between different time intervals.

### Dependencies

The following dependencies are used in this project:

- `flutter_bloc`: State management using the Bloc pattern.
- `fl_chart`: For rendering interactive line charts.
- `dio`: For making API calls to fetch real-time stock data.

Add the dependencies to your `pubspec.yaml` file:

```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_bloc: ^8.1.6
  fl_chart: ^0.68.0
  dio: ^5.4.3+1

