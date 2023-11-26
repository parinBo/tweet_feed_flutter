class PostModel {
  String _id;
  String _text;
  int likes;
  String userId;
  DateTime? createDate;
  DateTime? updateDate;

  String get id => _id;
  set setId(String value) => _id = value;

  get text => _text;
  set text(value) => _text = value;

  get getLikes => likes;
  set setLikes(likes) => this.likes = likes;

  get getUserId => userId;
  set setUserId(userId) => this.userId = userId;

  get getCreateDate => createDate;
  set setCreateDate(createDate) => this.createDate = createDate;

  get getUpdateDate => updateDate;
  set setUpdateDate(updateDate) => this.updateDate = updateDate;

  PostModel(
      {String id = '',
      this.userId = '',
      String text = '',
      this.likes = 0,
      createDate,
      updateDate})
      : _id = id,
        _text = text;

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
      text: json['text'] ?? '',
      userId: json['userid]'],
      likes: json['likes'],
      createDate: json['createDate'],
      updateDate: json['updateDate']);
}
