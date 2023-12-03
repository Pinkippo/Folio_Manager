import 'package:folio_front/app/controller/folio_controller.dart';
import 'package:folio_front/app/controller/read_folio_controller.dart';
import 'package:folio_front/data/provider/api.dart';
import 'package:folio_front/data/repository/folio_repository.dart';
import 'package:get/get.dart';

class FolioReadBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FolioReadController>(() {
      return FolioReadController(
          folioRepository:
          FolioRepository());
    });
  }
}