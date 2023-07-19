import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:inflearn_getx/bind/post_detail_bind.dart';

import 'package:inflearn_getx/view/home/home_view.dart';
import 'package:inflearn_getx/view/photo/photo_view.dart';
import 'package:inflearn_getx/view/post/post_detail_view.dart';
import 'package:inflearn_getx/view/post/post_view.dart';
import '../view/main_view.dart';



// page name 정의
class RouteInfo {

  static const String routeRoot = '/';
  static const String routePostDetail = '/post/detail';

  // static const String routeHome = '/';
  // static const String routePhoto = '/';
  // static const String routePost = '/';

  static List<GetPage> pages = [
    GetPage(name: routeRoot, page: () => const MainView()),

    // PostDetailView에 바인딩 될 바인드를 정의
    // 아래 3개의 View들에 대한 바인드 주입은 main.dart에서 해줌.
    GetPage(name: routePostDetail, page: () => const PostDetailView(), binding: PostDetailBind()),
  ];

  static List<Widget> navBarPages = const [
    HomeView(),
    PostView(),
    PhotoView(),
  ];
}