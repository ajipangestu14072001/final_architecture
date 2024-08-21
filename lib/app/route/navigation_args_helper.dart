class NavigationArgsHelper {
  final Map<String, dynamic> _arguments;

  NavigationArgsHelper(this._arguments);

  T getArgument<T>(String key, {T Function(Map<String, dynamic>)? fromJson}) {
    final arg = _arguments[key];
    if (arg is T) {
      return arg;
    } else if (arg is Map<String, dynamic> && fromJson != null) {
      return fromJson(arg);
    }
    throw ArgumentError('Argument with key $key is not of type $T');
  }

  static Map<String, dynamic> toJson(Map<String, dynamic> arguments) {
    final args = <String, dynamic>{};

    arguments.forEach((key, value) {
      if (value is ToJsonConvertible) {
        args[key] = value.toJson();
      } else {
        args[key] = value;
      }
    });

    return args;
  }

  static NavigationArgsHelper fromJson(Map<String, dynamic> json) {
    return NavigationArgsHelper(json);
  }
}

abstract class ToJsonConvertible {
  Map<String, dynamic> toJson();
}
