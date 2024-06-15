
import 'package:final_project/services/api_service.dart';
import 'package:final_project/services/hive_service.dart';
import 'package:final_project/services/media_service.dart';
import 'package:final_project/services/navigation_service.dart';
import 'package:get_it/get_it.dart';


Future<void> registerServices() async {
  final GetIt getIt = GetIt.instance;

  getIt.registerSingleton<NavigationService>(NavigationService());
  getIt.registerSingleton<MediaService>(MediaService());
  getIt.registerSingleton<ApiService>(ApiService());
  getIt.registerSingleton<HiveService>(HiveService());
}

mixin ServicesMixin {
  final NavigationService navigationService = GetIt.instance.get<NavigationService>();
  final HiveService hiveService = GetIt.instance.get<HiveService>();
  final ApiService apiService = GetIt.instance.get<ApiService>();
  final MediaService mediaService = GetIt.instance.get<MediaService>();
}