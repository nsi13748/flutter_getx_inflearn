import 'package:get/get.dart';

class HomeController extends GetxController {

  // 홈 컨트롤러에 로딩 표시를 제어하기 위한 변수
  RxBool isLoading = true.obs;

  // HomeController 에 대한 초기 설정
  @override
    void onInit() {
      super.onInit();

      _getData();       // 데이터를 가져오는 동안에는 로딩화면이 보이고, 데이터를 가져온 후 로딩화면이 사라진다.
  }

  //  HomeController 가 초기 데이터를 가져올 수 있도록 함수 구현
  Future<void> _getData() async {
    isLoading(true);                  // 데이터를 가져오는 동안에 로딩화면 띄우기

    // get data 코드

    isLoading(false);
  }

}