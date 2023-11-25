import '../model/board_response_model.dart';
import '../provider/api.dart';

import 'package:http/http.dart' as http;

/// 회원 데이터 처리 클래스
class BoardRepository{

  /// 메인 리스트 호출
  Future<List<BoardResponseModel>> getMainList (int pageNumber, int pageSize) async {
    return MyApiClient().getMainList(
        pageNumber, pageSize
    );
  }


}