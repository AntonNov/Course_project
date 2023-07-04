import 'package:delivery_app/custom_classes/comment.dart';
import 'package:json_annotation/json_annotation.dart';
part 'pizza.g.dart';

@JsonSerializable()
class Pizza {
  final String photo;
  final String name;
  @JsonKey(name: 'price_L')
  final double priceL;
  @JsonKey(name: 'price_M')
  final double priceM;
  final List<Comment> comments;
  final String? description;

  Pizza(this.photo, this.name, this.priceL, this.priceM, this.comments,
      this.description);

  factory Pizza.fromJson(Map<String, dynamic> json) => _$PizzaFromJson(json);

  Map<String, dynamic> toJSon() => _$PizzaToJson(this);
}
