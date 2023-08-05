// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comment _$CommentFromJson(Map<String, dynamic> json) => Comment(
      json['title'] as String,
      json['text'] as String,
      (json['rating'] as num).toDouble(),
      json['date'] as String,
      json['name'] as String,
    );

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      'title': instance.title,
      'text': instance.text,
      'rating': instance.rating,
      'date': instance.date,
      'name': instance.name,
    };
