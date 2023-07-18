import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:diyo/helpers/flash_message_helper.dart';
import 'package:diyo/models/base_response.dart';
import 'package:diyo/models/user.dart';
import 'package:diyo/repositories/base_repository.dart';
import 'package:diyo/services/hive_service.dart';
import 'package:diyo/utils/constants.dart';
import 'package:diyo/utils/enums.dart';
import 'package:diyo/utils/exceptions.dart';
import 'package:diyo/utils/typedefs.dart';

class AuthRepository extends BaseRepository {
  Future<BaseResponse<User>> submitLogin(
    String email,
    String password,
  ) async {
    final response = await post(
      ApiEndPoint.kApiExample,
      data: {
        'email': email,
        'password': password,
      },
    );

    if (response.status == ResponseStatus.success) {
      final data = response.data! as MapString;
      final rawData = data['data'] as MapString;

      final user = User.fromJson(rawData);
      GetIt.I<HiveService>().storeUser(user);

      final storage = GetIt.I<FlutterSecureStorage>();

      await storage.write(key: kAccessToken, value: user.token);

      return BaseResponse.success(user);
    }
    throw CustomExceptionString(response.message ?? 'Unknown error');
  }
}
