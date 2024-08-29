import 'dart:convert';
import 'package:final_architecture/services/network/environment.dart';
import 'package:final_architecture/utils/firebase/remote_config_utils.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_component/shared_component.dart';
import 'app/route/app_routes.dart';
import 'app/route/observer_navigator.dart';
import 'app/route/screen.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
  await RemoteConfigUtils.initializeRemoteConfig();
  await Environment.initialize('dev');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: createTextTheme(Theme.of(context).colorScheme),
      ),
      initialRoute: Screen.splash,
      getPages: AppRoutes.getPages(),
      navigatorObservers: [ObserverNavigator()],
    );
  }
}

// const String remote_config_key = 'base_url_api';
//
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo Remote Config',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(title: 'Flutter Demo Remote Config'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key, required this.title}) : super(key: key);
//
//   final String title;
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
//   String? apiUrl;
//
//   @override
//   void initState() {
//     super.initState();
//     _initializeRemoteConfig();
//   }
//
//   Future<void> _initializeRemoteConfig() async {
//     await remoteConfig.setConfigSettings(RemoteConfigSettings(
//       fetchTimeout: const Duration(seconds: 10),
//       minimumFetchInterval: const Duration(hours: 1),
//     ));
//     await remoteConfig.fetchAndActivate();
//     _updateApiUrl();
//   }
//
//   void _updateApiUrl() {
//     try {
//       final apiUrlsJson = remoteConfig.getString(remote_config_key);
//       print('Fetched Remote Config JSON: $apiUrlsJson');
//
//       if (apiUrlsJson.isEmpty) {
//         throw FormatException('The fetched JSON is empty.');
//       }
//
//       final apiUrls = Map<String, dynamic>.from(jsonDecode(apiUrlsJson));
//       print('Decoded API URLs: $apiUrls');
//
//       // Example usage of 'dev' key
//       setState(() {
//         apiUrl = apiUrls['dev'] as String?;
//       });
//       print('API URL for dev: $apiUrl');
//     } catch (e) {
//       print('Error fetching data: $e');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Text(apiUrl != null ? 'API URL: $apiUrl' : 'Loading...'),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => _updateApiUrl(),
//         tooltip: 'Sync',
//         child: Icon(Icons.sync),
//       ),
//     );
//   }
// }
