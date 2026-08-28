import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruits_hub/features/auth/data/models/user_model.dart';
import 'package:fruits_hub/features/auth/domain/entity/user_entity.dart';

import 'data_service.dart';

class FireStoreService implements DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData(String path, Map<String, dynamic> data) async {
    await firestore.collection(path).add(data);
  }

  @override
  Future<UserEntity> getUserData(String path, String uId) async {
    var data = await firestore.collection(path).doc(uId).get();

    return UserModel.fromMap(data.data() as Map<String, dynamic>);
  }
}
