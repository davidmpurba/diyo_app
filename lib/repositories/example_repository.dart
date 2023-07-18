import 'package:diyo/models/base_response.dart';
import 'package:diyo/repositories/base_repository.dart';
import 'package:diyo/utils/constants.dart';

class ExampleRepository extends BaseRepository {
  Future<BaseResponse<List>> getExamples(String key) async {
    final response = await get(
      ApiEndPoint.kApiExample,
      queryParameters: <String, String>{
        'search_columns': 'name',
        'search_key': key,
        'page': '-1',
      },
    );

    final result = responseWrapper<List>(response);

    return BaseResponse.success(result);
  }
}
