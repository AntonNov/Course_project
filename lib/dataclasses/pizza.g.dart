// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pizza.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PizzaAdapter extends TypeAdapter<Pizza> {
  @override
  final int typeId = 0;

  @override
  Pizza read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Pizza(
      fields[0] as String,
      fields[1] as String,
      fields[2] as double,
      fields[3] as double,
      (fields[4] as List).cast<Comment>(),
      fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Pizza obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.photo)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.priceL)
      ..writeByte(3)
      ..write(obj.priceM)
      ..writeByte(4)
      ..write(obj.comments)
      ..writeByte(5)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PizzaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
      json['description'] as String?,
    );

Map<String, dynamic> _$PizzaToJson(Pizza instance) => <String, dynamic>{
      'photo': instance.photo,
      'name': instance.name,
      'price_L': instance.priceL,
      'price_M': instance.priceM,
      'comments': instance.comments,
      'description': instance.description,
    };
