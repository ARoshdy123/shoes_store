# shoes_store

A simple Flutter Task built using Clean Architecture principles.a grid view that displays shoe items with local asset images. It uses GetIt for dependency injection and Cubit (from flutter_bloc) for state management.

## Features

### **Clean Architecture**
- The project is divided into Data, Domain, controller and Presentation layers

### **State Management**
- Uses Cubit for managing the UI state.

### **Dependency Injection**
-  GetIt is used to register and resolve dependencies.
- The injection_container.dart registers all the necessary dependencies (data source, repository, use case, and Cubit) using GetIt.

## State Management: `flutter_bloc`

- To enhance the application's functionality, `flutter_bloc` has been integrated.
- The UI reacts to state changes (loading, loaded, error) emitted by the Cubit.
## Grid View Layout:
- The grid view is built using GridView.builder and displays local images with Image.asset.



