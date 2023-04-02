import 'package:clean_architecture_flutter_2023/data/http/http_client.dart';
import 'package:clean_architecture_flutter_2023/data/http/http_error.dart';
import 'package:clean_architecture_flutter_2023/data/http/http_type.dart';
import 'package:clean_architecture_flutter_2023/infra/http/http_adapter.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';

class ClientMock extends Mock implements Client {}

void main() {
  late ClientMock client;
  late HttpClient sut;
  late String url;
  late Uri uri;

  setUp(() {
    client = ClientMock();
    sut = HttpAdapter(client);
    url = faker.internet.httpUrl();
    uri = Uri.parse(url);
  });

  group('Método Get', () {
    When mockGetRequest() => when(() => client.get(
          uri,
          headers: any(named: 'headers'),
        ));

    void mockResponse(int statusCode,
        {String? body = '{"any_key":"any_value"}'}) {
      mockGetRequest().thenAnswer((_) async => Response(body!, statusCode));
    }

    test('Deve retornar Success no método Get', () async {
      mockResponse(200);
      final response = await sut.request(url: url, method: HttpType.get);
      expect(response, {'any_key': 'any_value'});
    });

    test('Deve retornar BadRequest no método Get', () async {
      mockResponse(400);
      try {
        final response = await sut.request(url: url, method: HttpType.get);
      } on HttpError catch (error) {
        expect(error, HttpError.badRequest);
      }
    });

    test('Deve retornar Unauthorized no método Get', () async {
      mockResponse(401);
      try {
        final response = await sut.request(url: url, method: HttpType.get);
      } on HttpError catch (error) {
        expect(error, HttpError.unauthorized);
      }
    });

    test('Deve retornar Unauthorized no método Get', () async {
      mockResponse(403);
      try {
        final response = await sut.request(url: url, method: HttpType.get);
      } on HttpError catch (error) {
        expect(error, HttpError.forbidden);
      }
    });

    test('Deve retornar NotFound no método Get', () async {
      mockResponse(404);
      try {
        final response = await sut.request(url: url, method: HttpType.get);
      } on HttpError catch (error) {
        expect(error, HttpError.notFound);
      }
    });

    test('Deve retornar ServerError no método Get', () async {
      mockResponse(500);
      try {
        final response = await sut.request(url: url, method: HttpType.get);
      } on HttpError catch (error) {
        expect(error, HttpError.serverError);
      }
    });
  });
  group('Método Post', () {
    When mockGetRequest() => when(() => client.post(uri,
        headers: any(named: 'headers'), body: any(named: 'body')));

    void mockResponse(int statusCode,
        {String? body = '{"any_key":"any_value"}'}) {
      mockGetRequest().thenAnswer((_) async => Response(body!, statusCode));
    }

    test('Deve retornar Success no método Post', () async {
      mockResponse(200);
      final response = await sut.request(url: url, method: HttpType.post);
      expect(response, {'any_key': 'any_value'});
    });

    test('Deve retornar BadRequest no método Post', () async {
      mockResponse(400);
      try {
        final response = await sut.request(url: url, method: HttpType.post);
      } on HttpError catch (error) {
        expect(error, HttpError.badRequest);
      }
    });

    test('Deve retornar Unauthorized no método Post', () async {
      mockResponse(401);
      try {
        final response = await sut.request(url: url, method: HttpType.post);
      } on HttpError catch (error) {
        expect(error, HttpError.unauthorized);
      }
    });

    test('Deve retornar Unauthorized no método Post', () async {
      mockResponse(403);
      try {
        final response = await sut.request(url: url, method: HttpType.post);
      } on HttpError catch (error) {
        expect(error, HttpError.forbidden);
      }
    });

    test('Deve retornar NotFound no método Post', () async {
      mockResponse(404);
      try {
        final response = await sut.request(url: url, method: HttpType.post);
      } on HttpError catch (error) {
        expect(error, HttpError.notFound);
      }
    });

    test('Deve retornar ServerError no método Post', () async {
      mockResponse(500);
      try {
        final response = await sut.request(url: url, method: HttpType.post);
      } on HttpError catch (error) {
        expect(error, HttpError.serverError);
      }
    });
  });
  group('Método Put', () {
    When mockGetRequest() => when(() => client.put(uri,
        headers: any(named: 'headers'), body: any(named: 'body')));

    void mockResponse(int statusCode,
        {String? body = '{"any_key":"any_value"}'}) {
      mockGetRequest().thenAnswer((_) async => Response(body!, statusCode));
    }

    test('Deve retornar Success no método Put', () async {
      mockResponse(200);
      final response = await sut.request(url: url, method: HttpType.put);
      expect(response, {'any_key': 'any_value'});
    });

    test('Deve retornar BadRequest no método Put', () async {
      mockResponse(400);
      try {
        final response = await sut.request(url: url, method: HttpType.put);
      } on HttpError catch (error) {
        expect(error, HttpError.badRequest);
      }
    });

    test('Deve retornar Unauthorized no método Put', () async {
      mockResponse(401);
      try {
        final response = await sut.request(url: url, method: HttpType.put);
      } on HttpError catch (error) {
        expect(error, HttpError.unauthorized);
      }
    });

    test('Deve retornar Unauthorized no método Put', () async {
      mockResponse(403);
      try {
        final response = await sut.request(url: url, method: HttpType.put);
      } on HttpError catch (error) {
        expect(error, HttpError.forbidden);
      }
    });

    test('Deve retornar NotFound no método Put', () async {
      mockResponse(404);
      try {
        final response = await sut.request(url: url, method: HttpType.put);
      } on HttpError catch (error) {
        expect(error, HttpError.notFound);
      }
    });

    test('Deve retornar ServerError no método Put', () async {
      mockResponse(500);
      try {
        final response = await sut.request(url: url, method: HttpType.put);
      } on HttpError catch (error) {
        expect(error, HttpError.serverError);
      }
    });
  });
}
