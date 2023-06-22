// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pizza.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pizza _$PizzaFromJson(Map<String, dynamic> json) => Pizza(
      json['photo'] as String,
      json['name'] as String,
      (json['price_L'] as num).toDouble(),
      (json['price_M'] as num).toDouble(),
      (json['comments'] as List<dynamic>)
          .map((e) => Comment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PizzaToJson(Pizza instance) => <String, dynamic>{
      'photo': instance.photo,
      'name': instance.name,
      'price_L': instance.priceL,
      'price_M': instance.priceM,
      'comments': instance.comments,
    };
