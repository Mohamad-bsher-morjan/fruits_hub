
abstract class DatabaseService {
  Future<void> addData(String path, Map<String, dynamic> data);
  Future<Map<String, dynamic>> getData({required String path, required String uId});
}
