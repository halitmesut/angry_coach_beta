import 'package:hive/hive.dart';

part 'createdfood.g.dart';

@HiveType(typeId: 0)
class CreatedFood extends HiveObject {
  @HiveField(0, defaultValue: 0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final int amount;
  @HiveField(3)
  final int calorie;
  @HiveField(4)
  final int carbohydrate;
  @HiveField(5)
  final int protein;

  CreatedFood(
      {required this.id,
      required this.name,
      required this.amount,
      required this.calorie,
      required this.carbohydrate,
      required this.protein});
}
