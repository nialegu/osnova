import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/database.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString("password", "123456");

  sl.registerLazySingleton(() => AppDatabase());
  sl.registerLazySingleton(() => prefs);
  sl.registerLazySingleton(() => FirebaseFirestore.instance);
}
