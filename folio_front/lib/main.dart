import 'package:flutter/material.dart';
import 'package:folio_front/app/route/app_pages.dart';
import 'package:folio_front/app/route/app_routes.dart';
import 'package:get/get.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();

  runApp(GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.initial,
      getPages: AppPages.pages,
    )
  );
}
