part of 'app_pages.dart';

abstract class Routes{
  Routes._(); // 생성자 private

  static const initial = '/';
  static const splash = '/splash';
  static const login = '/login';
  static const register = '/register';
  static const create = '/create';
  static const portfolio = '/folio';

}