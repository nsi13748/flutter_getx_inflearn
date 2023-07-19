import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inflearn_getx/common/named_info.dart';
import 'package:inflearn_getx/controller/home_controller.dart';

import '../../component/loading_widget.dart';


class HomeView extends  GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Column(
              children: [
                Card(
                  margin: const EdgeInsets.all(16),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Image.asset('assets/img/flutter_logo.png',
                        width: 24),
                        const SizedBox(width: 16,),
                        Expanded(child: Text(NamedInfo.names['home.card.1'].toString(),)),
                      ],
                    ),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.all(16),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: SizedBox(
                      width: double.infinity,                               // 문장이 짧아 졌을때, 박스를 왼쪽으로 정렬
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const FlutterLogo(),
                          const SizedBox(height: 16,),
                          Text(NamedInfo.names['home.card.2'].toString()),
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.all(16),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.flutter_dash, color: Colors.lightBlue,),
                          const SizedBox(height: 16,),
                          Text(NamedInfo.names['home.card.3'].toString(),),
                        ],
                      ),
                    ),
                  ),
                )
              ],
        ),
              Obx(() => LoadingWidget(isVisible: controller.isLoading.value,)),       // 로딩 표시를 Stack으로 올림
             ],
          ),),);
  }
}
