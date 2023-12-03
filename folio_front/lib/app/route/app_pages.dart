import 'package:flutter/cupertino.dart';
import 'package:folio_front/app.dart';
import 'package:folio_front/app/binding/folio_binding.dart';
import 'package:folio_front/app/binding/login_binding.dart';
import 'package:folio_front/app/binding/read_folio_binding.dart';
import 'package:folio_front/app/controller/folio_controller.dart';
import 'package:folio_front/app/screen/create_portfolio_page.dart';
import 'package:folio_front/app/screen/login_page.dart';
import 'package:folio_front/app/screen/main_page.dart';
import 'package:folio_front/app/screen/regist_page.dart';
import 'package:get/get.dart';

import '../screen/portfolio_read_page.dart';
part 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
        name: Routes.initial, page: () => const App(), binding: LoginBinding() , transition: Transition.native),
    GetPage(
        name: Routes.login, page: () => const LoginPage(), binding: LoginBinding(), transition: Transition.native),
    GetPage(
        name: Routes.register, page: () => const RegisterPage(), binding: LoginBinding(), transition: Transition.native),
    GetPage(
        name: Routes.create, page: () => const CreatePortfolioPage(), binding: FolioBinding(), transition: Transition.native),
    GetPage(
        name: Routes.portfolio, page: () => const ReadPortFolioPage(), binding: FolioReadBinding() ,transition: Transition.native, parameters: const {'email': ''}),
  ];
}