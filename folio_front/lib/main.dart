import 'package:flutter/material.dart';
import 'package:folio_front/app/route/app_pages.dart';
import 'package:folio_front/theme/app_theme.dart';
import 'package:get/get.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();

  runApp(GetMaterialApp(
      builder: (context, child) {
      final MediaQueryData data = MediaQuery.of(context);
        return MediaQuery(
          data: data.copyWith(textScaleFactor: 1.0),
          child: child!,
        );
      },
      debugShowCheckedModeBanner: false,

      initialRoute: Routes.initial,
      getPages: AppPages.pages,
      theme: appThemeData,
    )
  );
}
