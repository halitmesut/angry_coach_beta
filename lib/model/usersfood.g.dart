// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usersfood.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UsersFoodAdapter extends TypeAdapter<UsersFood> {
  @override
  final int typeId = 1;

  @override
  UsersFood read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UsersFood(
      id: fields[0] == null ? 0 : fields[0] as int,
      name: fields[1] as String,
      amount: fields[2] as int,
      calorie: fields[3] as int,
      carbohydrate: fields[4] as int,
      protein: fields[5] as int,
      fat: fields[6] as int,
    );
  }

  @override
  void write(BinaryWriter writer, UsersFood obj) {
    writer
      ..writeByte(7)
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
      ..write(obj.protein)
      ..writeByte(6)
      ..write(obj.fat);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UsersFoodAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
