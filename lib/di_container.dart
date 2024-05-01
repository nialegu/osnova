import 'package:get_it/get_it.dart';
import 'package:osnova/data/database.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final prefs = await SharedPreferences.getInstance();

  sl.registerLazySingleton(() => AppDatabase());
}
