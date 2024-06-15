import 'package:final_project/core/constants/string_constants.dart';
import 'package:final_project/models/response_model.dart';
import 'package:final_project/services/get_it_service.dart';
import 'package:final_project/services/hive_service.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

final class Functions
{
  Future setUp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ResponseModelAdapter());
  final hiveService = HiveService();
  await hiveService.init();
  await registerServices();
}

  void precache(BuildContext context) {
      for (String path in AssetsPath.precacheList) {
        precacheImage(AssetImage(path), context);
      }
    }
  }