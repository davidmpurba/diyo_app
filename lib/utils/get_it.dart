import 'package:dio/dio.dart';
import 'package:diyo/helpers/flash_message_helper.dart';
import 'package:diyo/helpers/navigation_helper.dart';
import 'package:diyo/helpers/notification_helper.dart';
import 'package:diyo/helpers/user_helper.dart';
import 'package:diyo/services/hive_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

/// Container for DI
class GetItContainer {
  /// Initialize the DI Contanier in MainApp
  static void initialize() {
    GetIt.I.registerSingleton<HiveService>(HiveService(Hive));
    GetIt.I.registerSingleton<UserHelper>(UserHelper());

    GetIt.I.registerSingleton<NavigationHelper>(
      NavigationHelper(),
    );
    GetIt.I.registerSingleton<FlashMessageHelper>(FlashMessageHelper());

    GetIt.I
        .registerSingleton<FlutterSecureStorage>(const FlutterSecureStorage());

    GetIt.I.registerSingleton<NotificationHelper>(NotificationHelper());
  }

  /// Initialize the DI Container in SplashScreen
  static void initializeConfig(Dio dio) {
    GetIt.I.registerSingleton<Dio>(dio);
  }
}
