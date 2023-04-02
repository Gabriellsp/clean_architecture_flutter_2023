import 'dart:convert';
import 'package:clean_architecture_flutter_2023/data/http/http_client.dart';
import 'package:http/http.dart';
import 'package:clean_architecture_flutter_2023/data/http/http_error.dart';
import 'package:clean_architecture_flutter_2023/data/http/http_type.dart';

class HttpAdapter implements HttpClient {
  final Client _client;
  final String host = "";
  HttpAdapter(Client client) : _client = client;
  @override
  Future<Map?> request(
      {required String url,
      required HttpType method,
      Map? body,
      Map? headers}) async {
    final defaultHeaders = headers?.cast<String, String>() ?? {}
      ..addAll(
          {'content-type': 'application/json', 'accept': 'application/json'});
    final jsonBody = body != null ? jsonEncode(body) : null;
    var response = Response('', 500);
    Future<Response>? futureResponse;
    try {
      switch (method) {
        case HttpType.get:
          futureResponse = _client.get(Uri.parse(url), headers: defaultHeaders);
          break;
        case HttpType.post:
          futureResponse = _client.post(Uri.parse(url),
              headers: defaultHeaders, body: jsonBody);
          break;
        case HttpType.put:
          futureResponse = _client.put(Uri.parse(url),
              headers: defaultHeaders, body: jsonBody);
          break;
      }
      response = await futureResponse.timeout(const Duration(seconds: 10));
    } catch (error) {
      throw HttpError.serverError;
    }
    return _handleResponse(response);
  }

  Map<String, dynamic> _handleResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        return response.body.isEmpty ? null : jsonDecode(response.body);
      case 400:
        throw HttpError.badRequest;
      case 401:
        throw HttpError.unauthorized;
      case 403:
        throw HttpError.forbidden;
      case 404:
        throw HttpError.notFound;
      default:
        throw HttpError.serverError;
    }
  }
}
