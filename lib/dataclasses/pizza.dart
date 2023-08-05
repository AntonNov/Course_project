import 'package:delivery_app/dataclasses/comment.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:hive/hive.dart';
part 'pizza.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class Pizza {
  @HiveField(0)
  final String photo;

  @HiveField(1)
  final String name;

  @HiveField(2)
  @JsonKey(name: 'price_L')
  final double priceL;

  @HiveField(3)
  @JsonKey(name: 'price_M')
  final double priceM;

  @HiveField(4)
  final List<Comment> comments;

  @HiveField(5)
  final String? description;

  Pizza(this.photo, this.name, this.priceL, this.priceM, this.comments,
      this.description);

  factory Pizza.fromJson(Map<String, dynamic> json) => _$PizzaFromJson(json);

  Map<String, dynamic> toJSon() => _$PizzaToJson(this);
}
