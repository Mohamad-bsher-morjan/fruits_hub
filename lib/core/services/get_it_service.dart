import 'package:fruits_hub/core/services/data_service.dart';
import 'package:fruits_hub/core/services/firebase_auth_service.dart';
import 'package:fruits_hub/core/services/firestore_service.dart';
import 'package:fruits_hub/features/auth/data/repos/auth_repo_impl.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetit() {
  if (!getIt.isRegistered<FirebaseAuthService>()) {
    getIt.registerLazySingleton<FirebaseAuthService>(
      () => FirebaseAuthService(),
    );
  }

  getIt.registerLazySingleton<DatabaseService>(() => FireStoreService());

  if (!getIt.isRegistered<AuthRepo>()) {
    getIt.registerLazySingleton<AuthRepo>(
      () => AuthRepoImpl(
        firebaseAuthService: getIt<FirebaseAuthService>(),
        databaseService: getIt<DatabaseService>(),
      ),
    );
  }
}
