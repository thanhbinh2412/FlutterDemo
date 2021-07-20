import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../platform/network_info.dart';
import '../secure_keys/secure_keys.dart';
import '../snack_bar/snack_bar_show.dart';

// Created Dio Client
class DioClient extends NetworkInfo {
  // extends OAuth2 client to DIO Client

  /////////////////////////////////////
  final String _baseUrl = dotenv.env['BASE_URL'] ?? '';

  static BaseOptions opts = BaseOptions(
    connectTimeout: 120000,
    receiveTimeout: 10000,
  );
  final Dio _dio = Dio(
    opts,
  )..interceptors.add(Logging());

  Future get({required String url}) async {
    bool status = await getInternetStatus();

    Response? _response;
    try {
      if (status) {
        _response = await _dio.get(
          url,
        );
      } else {
        SnackBarCommon.snackBarErrorShow(
          "Không có internet",
          "Vui lòng kiểm tra lại kết nối internet",
        );
      }
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        try {
          var result = await InternetAddress.lookup('example.com');
          if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
            SnackBarCommon.snackBarErrorShow(
              "Kết nối đến server lỗi",
              "Vui lòng liên lạc người quản trị",
            );
          } else {
            SnackBarCommon.snackBarErrorShow(
              "Không có internet",
              "Vui lòng kiểm tra lại kết nối internet",
            );
          }
        } catch (e) {
          SnackBarCommon.snackBarErrorShow(
            "Không có internet",
            "Vui lòng kiểm tra lại kết nối internet",
          );
        }
      }
    } catch (e) {
      print(e);
    }
    return _response;
  }

  Future post({
    required String url,
    required Map<String, dynamic> dataReq,
  }) async {
    bool status = await getInternetStatus();
    Response? _response;
    try {
      if (status) {
        print(_baseUrl + url);
        _response = await _dio.post(
          _baseUrl + url,
          data: dataReq,
        );

        return _response;
      } else {
        SnackBarCommon.snackBarErrorShow(
          "Không có internet",
          "Vui lòng kiểm tra lại kết nối internet",
        );
      }
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
        return e.response;
      } else {
        try {
          var result = await InternetAddress.lookup('example.com');
          if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
            SnackBarCommon.snackBarErrorShow(
              "Kết nối đến server lỗi",
              "Vui lòng liên lạc người quản trị",
            );
          } else {
            SnackBarCommon.snackBarErrorShow(
              "Không có internet",
              "Vui lòng kiểm tra lại kết nối internet",
            );
          }
        } catch (e) {
          SnackBarCommon.snackBarErrorShow(
            "Không có internet",
            "Vui lòng kiểm tra lại kết nối internet",
          );
        }
      }
    }
  }

  /// Speacial API using for FirebaseNotification
  Future sendFirebaseNotiPost({
    required String url,
    required Map<String, dynamic> dataReq,
  }) async {
    bool status = await getInternetStatus();
    Response? _response;
    try {
      if (status) {
        _response = await _dio.post(
          url,
          data: dataReq,
        );

        return _response;
      } else {
        SnackBarCommon.snackBarErrorShow(
          "Không có internet",
          "Vui lòng kiểm tra lại kết nối internet",
        );
      }
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
        return e.response;
      } else {
        SnackBarCommon.snackBarErrorShow(
          "Kết nối đến server lỗi",
          "Kết nối đến server lỗi. Vui lòng liên lạc người quản trị",
        );
      }
    }
  }

  Future put({
    required String url,
    required Map<String, dynamic> dataReq,
  }) async {
    bool status = await getInternetStatus();

    Response? _response;
    try {
      if (status) {
        _response = await _dio.put(
          _baseUrl + url,
          data: dataReq,
        );
      } else {
        SnackBarCommon.snackBarErrorShow(
          "Không có internet",
          "Vui lòng kiểm tra lại kết nối internet",
        );
      }
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        SnackBarCommon.snackBarErrorShow(
          "Kết nối đến server lỗi",
          "Vui lòng liên lạc người quản trị",
        );
        print('Error sending request!');
        print(e.message);
      }
    }
    return _response;
  }

  Future putFile({
    required String url,
    required FormData formData,
    required String maSo,
    required String type,
  }) async {
    bool status = await getInternetStatus();

    Response? _response;
    try {
      if (status) {
        _dio.options.headers["MaSo"] = maSo;
        _dio.options.headers["type"] = type;
        _response = await _dio.post(url, data: formData);
      } else {
        SnackBarCommon.snackBarErrorShow(
          "Không có internet",
          "Vui lòng kiểm tra lại kết nối internet",
        );
      }
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        SnackBarCommon.snackBarErrorShow(
          "Kết nối đến server lỗi",
          "Vui lòng liên lạc người quản trị",
        );
        print('Error sending request!');
        print(e.message);
      }
    }
    return _response;
  }

  Future deleteFile({
    required String url,
    required String maSo,
    required String type,
  }) async {
    bool status = await getInternetStatus();

    Response? _response;
    try {
      if (status) {
        _dio.options.headers["MaSo"] = maSo;
        _dio.options.headers["type"] = type;
        _response = await _dio.delete(url);
      } else {
        SnackBarCommon.snackBarErrorShow(
          "Không có internet",
          "Vui lòng kiểm tra lại kết nối internet",
        );
      }
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        SnackBarCommon.snackBarErrorShow(
          "Kết nối đến server lỗi",
          "Vui lòng liên lạc người quản trị",
        );
        print('Error sending request!');
        print(e.message);
      }
    }
    return _response;
  }

  Future<void> delete({required String url}) async {
    try {
      await _dio.delete(_baseUrl + url);
    } catch (e) {
      SnackBarCommon.snackBarErrorShow(
        "Kết nối đến server lỗi",
        "Vui lòng liên lạc người quản trị",
      );
    }
  }
}

// Intercepter for API calls
class Logging extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // Create storage
    final storage = new FlutterSecureStorage();
    // Read value
    String token = await storage.read(
          key: KeysSecure.accessToken,
        ) ??
        '';
    options.headers.addAll({"Authorization": "Bearer $token"});
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print(
      'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
    );
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print(
      'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}',
    );
    return super.onError(err, handler);
  }
}

final dioClient = DioClient();
