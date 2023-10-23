import 'package:folio_front/app/route/app_routes.dart';
import 'package:folio_front/app/screen/app_page.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(
        name: Routes.initial, page: () => const App()),
  ];
}