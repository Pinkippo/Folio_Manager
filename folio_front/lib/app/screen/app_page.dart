import 'package:flutter/material.dart';
import 'package:folio_front/app/controller/app_controller.dart';
import 'package:folio_front/app/screen/login_page.dart';
import 'package:get/get.dart';


class App extends StatelessWidget {

  const App({super.key});

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
      title: 'Folio',
      home: const Text('Folio'),
    );
  }
}