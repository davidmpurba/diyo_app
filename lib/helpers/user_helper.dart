import 'package:diyo/helpers/flash_message_helper.dart';
import 'package:diyo/helpers/navigation_helper.dart';
import 'package:diyo/models/user.dart';
import 'package:diyo/services/hive_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

/// Service to manage the user so that it can be used in any class.
class UserHelper {
  // Is user logged in?
  bool get isLoggedIn => GetIt.I.get<HiveService>().getUser() != null;

  User? getUser() {
    return GetIt.I<HiveService>().getUser();
  }

  /// Handle logout
  Future<void> logout() async {
    try {
      await GetIt.I<HiveService>().deleteUser();
      await GetIt.I<FlutterSecureStorage>().deleteAll();
      GetIt.I<NavigationHelper>().goToLogin();
    } catch (e) {
      GetIt.I<FlashMessageHelper>().showError(e.toString());
    }
  }
}
