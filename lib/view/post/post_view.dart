import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:inflearn_getx/component/loading_widget.dart';
import 'package:inflearn_getx/controller/post_controller.dart';

class PostView extends GetView<PostController> {
  const PostView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            _posts(),
            Obx(
              () => LoadingWidget(isVisible: controller.isLoading.value),
            ),
          ],
        ),
      ),
    );
  }

  Widget _posts() {
    return Obx(() => ListView.separated(
      itemBuilder: (BuildContext context, int idx) {
        return ListTile(
          leading: const Icon(Icons.article_outlined),
          title: Text(controller.posts[idx].title, maxLines: 1, overflow: TextOverflow.ellipsis,),   // overflow : 한줄이 넘어가는 제목은 생략
        );
      },
      separatorBuilder: (BuildContext context, int idx) => Divider(),
      itemCount: controller.posts.length,
    ));
  }
}
