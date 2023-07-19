import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:inflearn_getx/bind/init_bind.dart';
import 'package:inflearn_getx/common/color_schemes.g.dart';
import 'package:inflearn_getx/route/route_info.dart';
import 'package:inflearn_getx/view/main_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      initialRoute: RouteInfo.routeRoot,  // -> '/'은 static으로 선언되어 객체생성을 하지 않아도 사용가능.
      initialBinding: InitBind(),         // Bind 주입하기: initalRoute에 적용해줄 controller들을 정의한 Bind로 주입한다.
      getPages: RouteInfo.pages,          // 페이지 목록

      defaultTransition: Transition.cupertino,  // 화면 전환 방식

      // 테마 및 폰트 적용
      themeMode: ThemeMode.light,                                              // 테마를 시스템에 맞게 적용
      theme: ThemeData(colorScheme: lightColorScheme, useMaterial3: true, fontFamily: 'NanumGothic'),      // 라이트 모드
      darkTheme: ThemeData(colorScheme: darkColorScheme, useMaterial3: true, fontFamily: 'NanumGothic'),   // 다크 모드

      // 폰트 적용

      );
  }
}