import 'dart:html';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:inflearn_getx/common/code_info.dart';

import '../api/api_info.dart';
import '../dto/post_model.dart';


// 1. Dao는 실제로 데이터를 가져오는 객체
// 2. GetConnect 를 상속
class PostDao extends GetConnect {

  @override
  void onInit() {
    super.onInit();


    // http 관련된 기본 설정
    httpClient.baseUrl = ApiInfo.basePostUrl;
    httpClient.defaultContentType = 'application/x-www-form-urlencoded';        // ???

    httpClient.addRequestModifier((Request request) {                           // 헤더 설정
      request.headers['Accept'] = 'application/json';
      return request;
    });
  }

  // Post 목록을 가져올 메서드 정의

  Future<Map<String, dynamic>> getPost() async{
    Map<String, dynamic> responseMap = <String, dynamic> {} ;                   // <String, dynamic> {} 함수 선언이 아니라 빈맵을 선언하는 코드!
    List<PostModel> postModelList = [];
    CodeInfo code = CodeInfo.ok;

    try {
      final Response res = await get('/posts');

      if(res.statusCode == HttpStatus.ok) {                                     // HttpSatus.ok = 200
        // res.body가 json 형태로 받은 데이터를 PostModel의 리스트로 반환한다.
        // factory 메서드인 PostModel.fromJson은 Map형태의 PostModel 객체를 생성한다.
        postModelList = res.body.map<PostModel>((json) => PostModel.fromJson(json)).toList();
      } else {
        code = CodeInfo.errer;
      }

    } catch(e) {
      code = CodeInfo.errer;
    }

    responseMap['postModelList'] = postModelList;
    responseMap['code'] = code;

    return responseMap;
  }

}