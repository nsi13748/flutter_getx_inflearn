// 앱이 시작되면 실행될 바인드라서 init_bind
import 'package:get/get.dart';
import 'package:inflearn_getx/controller/main_controller.dart';


// 의존성 주입
class InitBind extends Bindings {

  // 이 binding과 연결되면, 이 Bind에 있는 controller 모두와 연결되는 것인가??

  @override
  void dependencies() {
    Get.put(MainController());      // MainView에서 선언했던 GetView<MainController>의 MainController 를 사용할 수 있게 된다.
  }
}