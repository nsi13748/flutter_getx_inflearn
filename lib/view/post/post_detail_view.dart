import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inflearn_getx/common/named_info.dart';
import 'package:inflearn_getx/controller/post_controller.dart';

// 이 화면도 PostController를 사용
class PostDetailView extends GetView<PostController> {
  const PostDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(NamedInfo.names['post.detail.title'].toString()),
      ),
      body: SafeArea(
        child: _detail(),
      ),
    );
  }

  Widget _detail() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text('title'),
            const Divider(height: 48),
            Text('body'),
          ],
        ),
      ),
    );
  }
}
