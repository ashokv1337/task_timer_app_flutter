import 'package:flutter/material.dart';
import 'package:task_timer_app_flutter/screens/home_screen.dart';

import 'helpers/peferences_helper.dart';
import 'res/strings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  PreferencesHelper preferencesHelper = PreferencesHelper();

  _initializePreferencesHelper() async {
    await preferencesHelper.init();
  }

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      if (PreferencesHelper.sharedPreferences == null) {
        _initializePreferencesHelper();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: taskTimer,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(title: taskTimer),
    );
  }
}
