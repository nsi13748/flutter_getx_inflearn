import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:inflearn_getx/view/home/home_view.dart';
import 'package:inflearn_getx/view/photo/photo_view.dart';
import 'package:inflearn_getx/view/post/post_view.dart';
import '../view/main_view.dart';



// page name 정의
class RouteInfo {

  static const String routeRoot = '/';
  static const String routeHome = '/';
  static const String routePhoto = '/';
  static const String routePost = '/';

  static List<GetPage> pages = [
    GetPage(name: routeRoot, page: () => const MainView()),
  ];

  static List<Widget> navBarPages = const [
    HomeView(),
    PostView(),
    PhotoView(),
  ];
}