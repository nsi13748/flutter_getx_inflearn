import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inflearn_getx/common/named_info.dart';
import 'package:inflearn_getx/controller/main_controller.dart';

import '../route/route_info.dart';

// 1. stateless 를 GetView로 치환
// 2. 현재 뷰와 연결할 Controller를 제너릭으로 선언  ->  extends GetView<MainController>

class MainView extends GetView<MainController> {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 앱바
      appBar: AppBar(
        // Obx로 Listen할 Rx데이터가 있는 위젯을 감싸준다.
        title: Obx(
          () => Text(controller.title.value),
        ),
        centerTitle: true,
      ),

      // body
      body: SafeArea(
        child: Obx(() => RouteInfo.navBarPages[controller.navBarIdx.value]),
      ),

      // bottomNavigationBar
      bottomNavigationBar: Obx(() => NavigationBar(
        selectedIndex: controller.navBarIdx.value,
        onDestinationSelected: controller.onChangeNavBar,
        destinations: [
          NavigationDestination(icon: const Icon(Icons.home), label: NamedInfo.names['navBar.home']!),
          NavigationDestination(icon: const Icon(Icons.list_alt), label: NamedInfo.names['navBar.post']!),
          NavigationDestination(icon: const Icon(Icons.photo), label: NamedInfo.names['navBar.photo']!),
        ],
      )),
    );
  }
}
