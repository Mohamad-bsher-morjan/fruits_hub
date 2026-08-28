import 'package:fruits_hub/features/auth/domain/entity/user_entity.dart';

abstract class DatabaseService {
  Future<void> addData(String path, Map<String, dynamic> data);
  Future<UserEntity> getUserData(String path, String uId);
}