import 'package:flutter/material.dart';
import 'package:shared_component/shared_component.dart';

/// By using the ObserverNavigator class, you can gain insights into the navigation behavior of 
/// your app, which can be particularly useful for debugging and understanding the flow of route 
/// changes and arguments.

// Custom NavigatorObserver to monitor and log navigation events
class ObserverNavigator extends NavigatorObserver {
  
  // Called when a new route has been pushed onto the navigator
  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    LogUtility.writeLog('Navigated to ${route.settings.name}');
    _printArguments(route);
  }

  // Called when a route has been popped off the navigator
  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    LogUtility.writeLog('Popped from ${route.settings.name}');
    _printArguments(route);
  }

  // Called when a route has been removed from the navigator
  @override
  void didRemove(Route route, Route? previousRoute) {
    super.didRemove(route, previousRoute);
    LogUtility.writeLog('Removed ${route.settings.name}');
    _printArguments(route);
  }

  // Called when a route has been replaced by another route
  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    LogUtility.writeLog('Replaced ${oldRoute?.settings.name} with ${newRoute?.settings.name}');
    _printArguments(newRoute);
  }

  // Helper method to print the arguments of a route
  void _printArguments(Route? route) {
    if (route != null) {
      final arguments = route.settings.arguments;
      if (arguments != null) {
        LogUtility.writeLog('Arguments for ${route.settings.name}: $arguments');
      } else {
        LogUtility.writeLog('No arguments for ${route.settings.name}');
      }
    }
  }
}