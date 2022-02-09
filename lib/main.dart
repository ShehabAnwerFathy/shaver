import 'package:flutter/material.dart';
import 'package:shaver/common/device_service.dart';
import 'package:shaver/view/shaver.dart';

Future<void> main() async {
  // ensure initialize widgets before starting application
  WidgetsFlutterBinding.ensureInitialized();

  // setup app screen such as status bar color and system navigation bar color.
  await DeviceService.setupSystemChrome();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Shaver',
      debugShowCheckedModeBanner: false,
      home: ShaverView(),
    );
  }
}
