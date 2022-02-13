import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'common/app_bloc_observer.dart';
import 'common/device_service.dart';
import 'module/shaver/view/shaver.dart';

/// The start point of application.
Future<void> main() async {
  // ensure initialize widgets before starting application
  WidgetsFlutterBinding.ensureInitialized();

  // setup app screen such as status bar color and system navigation bar color.
  await DeviceService.setupSystemChrome();

  // start point of application UI.

  BlocOverrides.runZoned(
    () => runApp(const MyApp()),
    blocObserver: AppBlocObserver(),
  );
}

/// The root of the application.
class MyApp extends StatelessWidget {
  /// Initializes [key] for subclasses.
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Shaver',
      debugShowCheckedModeBanner: false,
      home: ShaverView(),
    );
  }
}
