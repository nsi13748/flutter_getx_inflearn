class PostModel {

  int userId ;
  int id ;
  String title;
  String body ;

  // 가능한 기본값을 줘서 예상치 못한 상황을 대비해야 한다.
  PostModel({
    this.userId = -1,
    this.id = -1,
    this.title = '',
    this.body = '',
});

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      userId: json['userId'] ?? -1,
      id: json['id'] ?? -1 ,
      title: json['title'],
      body: json['body'],
    );
  }


}