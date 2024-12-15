import 'package:publicapiapp/features/comments/domain/entities/comment.dart';

class CommentModel extends Comment {
  CommentModel({
    required int postId,
      required int id,
      required String name,
      required String email,
      required String body
  }) : super(
      postId: postId,
      id: id,
      name: name,
      email: email,
      body: body
  );

  factory CommentModel.fromJson(Map<String,dynamic>json){
    return CommentModel(
        postId: json['postId'],
        id: json['id'],
        name: json['name'],
        email: json['email'],
        body: json['body']
    );
  }
}
