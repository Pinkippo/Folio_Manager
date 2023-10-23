import 'package:flutter/material.dart';
import 'package:folio_front/app/controller/app_controller.dart';
import 'package:folio_front/app/screen/main_page.dart';
import 'package:get/get.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        final MediaQueryData data = MediaQuery.of(context);
        return MediaQuery(
          data: data.copyWith(textScaleFactor: 1.0),
          child: child!,
        );
      },
      home: const MainPage(),
    );
  }
}