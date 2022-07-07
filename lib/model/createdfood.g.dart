// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'createdfood.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CreatedFoodAdapter extends TypeAdapter<CreatedFood> {
  @override
  final int typeId = 0;

  @override
  CreatedFood read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CreatedFood(
      id: fields[0] == null ? 0 : fields[0] as int,
      name: fields[1] as String,
      amount: fields[2] as int,
      calorie: fields[3] as int,
      carbohydrate: fields[4] as int,
      protein: fields[5] as int,
    );
  }

  @override
  void write(BinaryWriter writer, CreatedFood obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.amount)
      ..writeByte(3)
      ..write(obj.calorie)
      ..writeByte(4)
      ..write(obj.carbohydrate)
      ..writeByte(5)
      ..write(obj.protein);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreatedFoodAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
