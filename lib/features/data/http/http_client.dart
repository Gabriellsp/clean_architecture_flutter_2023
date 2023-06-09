import 'package:clean_architecture_flutter_2023/features/data/http/http_type.dart';

abstract class IHttpClient {
  Future<Map?>? request(
      {required String url, required HttpType method, Map? body, Map? headers});
}
