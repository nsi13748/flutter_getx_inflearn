import 'package:get/get.dart';
import 'package:inflearn_getx/common/named_info.dart';

class MainController extends GetxController {
  RxString title = NamedInfo.names['title'].toString().obs;     // 앱바에 표시될 제목
  RxInt navBarIdx = 0.obs;      // bottomNavigation index

  void onChangeNavBar(int idx) {
    if (navBarIdx != idx) {
      navBarIdx(idx);      // navBarIdx = idx랑 같음
    }

    switch (idx) {
      case 1 : title(NamedInfo.names['post.title'].toString()); break;
      case 2 : title(NamedInfo.names['photo.title'].toString()); break;
      default: title(NamedInfo.names['title'].toString());

    }

  }
}