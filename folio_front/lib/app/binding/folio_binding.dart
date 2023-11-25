import 'package:folio_front/app/controller/folio_controller.dart';
import 'package:folio_front/data/provider/api.dart';
import 'package:folio_front/data/repository/folio_repository.dart';
import 'package:get/get.dart';


class FolioBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FolioController>(() {
      return FolioController(
          folioRepository:
          FolioRepository(apiClient: MyApiClient()));
    });
  }
}