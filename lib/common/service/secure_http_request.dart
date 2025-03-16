import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:ecnictech_fnb_ui/constant/enums.dart';

abstract class SecureHttpRequest {
  Future<dynamic> secureHttpRequest(String url, HttpMethod method,
      {Map<String, String>? headers, Object? body, Encoding? encoding});
}

class SecureHttpRequestImpl implements SecureHttpRequest {
  @override
  Future<dynamic> secureHttpRequest(String url, HttpMethod method,
      {Map<String, String>? headers, Object? body, Encoding? encoding}) async {
    try {
      final uri = Uri.parse(url);
      final Response response;
      switch (method) {
        case HttpMethod.head:
          response = await head(uri, headers: headers);
          break;
        case HttpMethod.get:
          response = await get(uri, headers: headers);
          break;
        case HttpMethod.post:
          response =
              await post(uri, headers: headers, body: body, encoding: encoding);
          break;
        case HttpMethod.put:
          response =
              await put(uri, headers: headers, body: body, encoding: encoding);
          break;
        case HttpMethod.patch:
          response = await patch(uri,
              headers: headers, body: body, encoding: encoding);
          break;
        case HttpMethod.delete:
          response = await delete(uri,
              headers: headers, body: body, encoding: encoding);
          break;
        case HttpMethod.read:
          return await read(uri, headers: headers);
        case HttpMethod.readbytes:
          return await readBytes(uri, headers: headers);
      }

      if (kDebugMode) {
        print("[secureHttpRequest] : ${response.body}");
      }

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception(
            'HTTP Request Failed: ${response.request?.url.toString()} - ${response.statusCode}.');
      }
    } on ClientException catch (e) {
      if (kDebugMode) {
        print('ClientException: $e');
      }
      return {'error': 'ClientException occurred $e'};
    } catch (e) {
      return {'error': 'An error occurred'};
    }
  }
}
