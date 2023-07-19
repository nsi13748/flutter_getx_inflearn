import 'package:get/get.dart';
import 'package:inflearn_getx/dto/post_model.dart';

import '../common/code_info.dart';
import '../dao/post_dao.dart';

class PostController extends GetxController {

  RxBool isLoading = false.obs;

  // Post 게시물을 담아줄 리스트
  RxList<PostModel> posts = <PostModel> [].obs;

  @override
  void onInit() {
    super.onInit();

    _getPosts();
  }

  Future<void> _getPosts() async {
    isLoading(true);

    // get Posts 로직. 여기서 DAO 호출
    try{

      // PostDao.to 는 종속성 관리자에 등록되어있는 PostDao의 싱글톤 인스턴스를 호출하는 것.
      Map<String, dynamic> result = await PostDao.to.getPosts();
      CodeInfo code = result['code'];

      if(code == CodeInfo.ok) {
        // 리스트를 활용
        List<PostModel> list = result['postList'];

        // 그리고 가져온 객체를 posts에 넣기
        posts.clear();
        posts.addAll(list);



      }
    } catch(e) {

    }

    isLoading(false);
  }

}