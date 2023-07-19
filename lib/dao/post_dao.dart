// import 'dart:html';
import 'package:get/get_connect/http/src/status/http_status.dart';  // dart.http 말고 get_connect/.../http_status.dart 를 import 해야한다.

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:inflearn_getx/common/code_info.dart';

import '../api/api_info.dart';
import '../dto/post_model.dart';


// 1. Dao는 실제로 데이터를 가져오는 객체
// 2. GetConnect 를 상속
class PostDao extends GetConnect {

  // 포스트 다오 객체 생성
  // to getter로 PostDao에 접근할 수있다.
  // GetX 패키지에서 제공하는 Get 종속성 관리 시스템을 사용하는 정적 getter.
  // Get.put(PostDao()) 는 PostDao 인스턴스를 생성하여 종속성 관리 시스템에 넣는 코드이다.

  // static 속성 : 인스턴스가 아닌 클래스 자체에 귀속되는 속성
  // Get.put(PostDao()) : PostDao 인스턴스를 생성하고 GetX 종속성 관리 시스템에 넣는다. 앱의 다른 위치에서 이 인스턴스를 검색하고 싶을때마다
  //                      Get.find<PostDao>() 를 사용하여 찾을 수 있다.
  // get to : PostDao의 인스턴스를 반환하는 to라는 getter를 선언.

  // 즉, 종속성 주입이 된 인스턴스를 return 받아서 PostDao에 할당한다.
  static PostDao get to => Get.put(PostDao());

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
  Future<Map<String, dynamic>> getPosts() async{
    Map<String, dynamic> responseMap = <String, dynamic> {} ;                   // <String, dynamic> {} 함수 선언이 아니라 빈맵을 선언하는 코드!
    List<PostModel> postModelList = [];
    CodeInfo code = CodeInfo.ok;

    try {
      final Response res = await get('/posts');
      print(res.runtimeType); // Response<dynamic>
      print(res);             // Instance of 'Response<dynamic>
      print(res.body);        // List<dynamic> -> [json1, json2, ...]

      if(res.statusCode == HttpStatus.ok) {                                     // HttpSatus.ok = 200
        // res.body는 List<json> 타입의 데이터 -> PostModel의 리스트로 반환한다.
        // map 함수로 factory 메서드인 PostModel.fromJson(json)에 적용 후 PostModel 타입 데이터로 반환한다.
        postModelList = res.body.map<PostModel>((json) => PostModel.fromJson(json)).toList();
        print(res.body.runtimeType);  //  List<dynamic>

      } else {
        code = CodeInfo.errer;
      }

    } catch(e) {
      code = CodeInfo.errer;
    }

    responseMap['postList'] = postModelList;
    responseMap['code'] = code;

    return responseMap;
  }


  // Post 상세 내역을 가져오는 메서드 정의


}