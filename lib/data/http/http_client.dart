import 'package:clean_architecture_flutter_2023/data/http/http_type.dart';

abstract class HttpClient {
  Future<Map?>? request(
      {required String url, required HttpType method, Map? body, Map? headers});
}
