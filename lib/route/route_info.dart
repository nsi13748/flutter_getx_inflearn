import 'package:get/get.dart';
import '../view/main_view.dart';



// page name 정의
class RouteInfo {

  static const String routeRoot = '/';

  static List<GetPage> page = [
    GetPage(name: routeRoot, page: () => const MainView()),
  ];
}