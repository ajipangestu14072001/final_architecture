# final_architecture

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# Project Procedure
## Create New Screen
- The first step is to create a route map on the dart `screen.dart`, create your `variable name` and `string route`,
- After that the next step is that you can create a `view` for your page, along with the `controller` and `repository`,
- After that, create a data binding that matches the name of the view you have created, with an underscore and lowercase format for the file name. for example `login_binding.dart`,
- After all is done, you can add to the `app_routes.dart` file for Definition of the AppRoutes class to manage application routes,
- After everything is done the view you created can be called by calling the screen name that has been defined for example `Screen.home`

# Get.lazyPut Method:
[Definition]: A method provided by the GetX package to lazily register a dependency.
[Purpose]: Registers a dependency with GetX so that it is created and initialized only when it is first needed, rather than at application startup. This can help optimize resource usage and improve application startup performance.
- `Get.lazyPut` is used to register dependencies with lazy initialization, ensuring that objects are created only when they are first accessed.