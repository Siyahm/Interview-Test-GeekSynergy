import 'package:hive/hive.dart';
part 'user_model.g.dart';

@HiveType(typeId: 1)
class UserModel {
  @HiveField(0)
  final String? name;
  @HiveField(1)
  final String? email;
  @HiveField(2)
  final String? password;
  @HiveField(3)
  final int? mobNum;
  @HiveField(4)
  final String? profession;

  UserModel({
    this.name,
    required this.email,
    required this.password,
    this.mobNum,
    this.profession,
  });
}
