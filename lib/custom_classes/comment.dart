import 'package:json_annotation/json_annotation.dart';
part 'comment.g.dart';

@JsonSerializable()
class Comment {
  final String title;
  final String text;
  final double rating;
  final String date;
  final String name;

  Comment(this.title, this.text, this.rating, this.date, this.name);

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);

  Map<String, dynamic> toJSon() => _$CommentToJson(this);
}
