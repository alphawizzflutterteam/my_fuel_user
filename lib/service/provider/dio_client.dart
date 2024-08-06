import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:test_prj/helper/common/custom_trace.dart';
import 'package:test_prj/helper/utils/app_constants.dart';
import 'package:test_prj/main.dart';
import 'package:test_prj/service/exceptions/network_exceptions.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

const _defaultConnectTimeout = Duration.millisecondsPerMinute;
const _defaultReceiveTimeout = Duration.millisecondsPerMinute;
String? tokenForNew;

class DioClient {
  final String baseUrl;

  late dio.Dio _dio;
  late dio.Options optionsNetwork;
  late dio.Options optionsCache;
  final List<dio.Interceptor>? interceptors;
  final _progress = <String>[].obs;
  final GetStorage _box = GetStorage();
  String? token;

  DioClient(
    this.baseUrl,
    dio.Dio? dio, {
    this.interceptors,
  }) {
    token = _box.read(AppConstants.token);
    _dio = dio ?? Dio();
    _dio
      ..options.baseUrl = baseUrl
      ..options.connectTimeout =
          const Duration(milliseconds: _defaultConnectTimeout)
      ..options.receiveTimeout =
          const Duration(milliseconds: _defaultReceiveTimeout)
      ..httpClientAdapter
      ..options.headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
        'Accept-Language': 'en'
      };
    log('Token: $token');
    if (interceptors?.isNotEmpty ?? false) {
      _dio.interceptors.addAll(interceptors ?? []);
    }
    if (kDebugMode) {
      _dio.interceptors.add(LogInterceptor(
          responseBody: true,
          error: true,
          requestHeader: false,
          responseHeader: false,
          request: false,
          requestBody: false));
    }
    optionsNetwork = Options(headers: _dio.options.headers);
    // optionsCache = Options(headers: _dio.options.headers);
    // if (!kIsWeb && !kDebugMode) {
    //   optionsNetwork = buildCacheOptions(Duration(days: 3),
    //       forceRefresh: true, options: optionsNetwork);
    //   optionsCache = buildCacheOptions(Duration(minutes: 10),
    //       forceRefresh: false, options: optionsCache);
    //   _dio.interceptors
    //       .add(DioCacheManager(CacheConfig(baseUrl: baseUrl)).interceptor);
    // }
  }

  void updateHeaders(String token) {
    _dio.options.headers['Authorization'] = 'Bearer $token';
    optionsNetwork.headers?['Authorization'] = 'Bearer $token';
  }

  Future<dynamic> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await _dio.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw FormatException("Unable to process the data");
    } catch (e) {
      throw NetworkExceptions.getDioException(e);
    }
  }

  Future<dynamic> getUri(
    Uri uri, {
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    CustomTrace programInfo = CustomTrace(StackTrace.current);
    try {
      _startProgress(programInfo);
      var response = await _dio.getUri(
        uri,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      _endProgress(programInfo);
      return response;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw FormatException("Unable to process the data");
    } on FlutterError catch (e) {
      print(e.runtimeType);
    } catch (e) {
      throw NetworkExceptions.getDioException(e);
    } finally {
      _endProgress(programInfo);
    }
  }

  void _endProgress(CustomTrace programInfo) {
    try {
      _progress.remove(_getTaskName(programInfo));
    } on FlutterError {}
  }

  void _startProgress(CustomTrace programInfo) {
    try {
      _progress.add(_getTaskName(programInfo));
    } on FlutterError {}
  }

  Future<dio.Response> post(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      dio.Response<dynamic> response = await _dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      log(data);
      return response;
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.response!.data);
        print(e.response!.headers);
        print(e.response!.requestOptions);
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
      }
      throw FormatException("Unable to process the data");
    } catch (e) {
      print("getDioException $e");
      // return ;
      throw NetworkExceptions.getDioException(e);
    }
  }

  Future<dynamic> postUri(
    Uri uri, {
    data,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    CustomTrace programInfo = CustomTrace(StackTrace.current);
    try {
      _startProgress(programInfo);
      var response = await _dio.postUri(
        uri,
        data: data,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      _endProgress(programInfo);
      return response;
    } on FormatException catch (_) {
      throw FormatException("Unable to process the data");
    } catch (e) {
      throw NetworkExceptions.getDioException(e);
    } finally {
      _endProgress(programInfo);
    }
  }

  Future<Map<String, dynamic>> postAPICallCompleteTest(
    Uri url,
    Map<String, String> param,
    String tokena, {
    File? testImages,
  }) async {
    var responseJson;
    Map<String, String> headers = {'Authorization': 'Bearer $tokena'};
    try {
      print("object AAAAAAAAA ${param}");
      log("object AAAAAAAAA ${token}");
      var request = http.MultipartRequest('POST', url);
      request.fields.addAll(param);
      if (testImages != null) {
        request.files
            .add(await http.MultipartFile.fromPath('image', testImages.path));
      }

      request.headers.addAll(headers);
      log('${url}');
      log('${param}');
      log('${request.files}');
      log('${request.headers}');
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      // switch(response.statusCode)

      // log('${response.body}');
      // log('${headers}');
      responseJson = _response(response);
    } on SocketException catch (e) {
      Fluttertoast.showToast(msg: 'No Internet connection '.tr);
    } on TimeoutException {
      Fluttertoast.showToast(msg: 'Something Went wrong'.tr);
    } on Exception catch (e) {
      Fluttertoast.showToast(msg: 'Something Went wrong with ${e.toString()}');
    }
    return responseJson;
  }

  dynamic _response(http.Response response) {
    print("Response ${response.body.toString()}");
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      // case 400:
      //   throw BadRequestException(response.body.toString());
      case 401:
        var responseJson = json.decode(response.body.toString());
        return responseJson;

      case 404:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 403:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      // throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw Exception(
            'Error occurred while Communication with Server with StatusCode: ${response.statusCode}');
    }
  }

  Future<dynamic> put(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await _dio.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on FormatException catch (_) {
      throw FormatException("Unable to process the data");
    } catch (e) {
      throw NetworkExceptions.getDioException(e);
    }
  }

  Future<dynamic> putUri(
    Uri uri, {
    data,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    CustomTrace programInfo = CustomTrace(StackTrace.current);
    try {
      _startProgress(programInfo);
      var response = await _dio.putUri(
        uri,
        data: data,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      _endProgress(programInfo);
      return response;
    } on FormatException catch (_) {
      throw FormatException("Unable to process the data");
    } catch (e) {
      throw NetworkExceptions.getDioException(e);
    } finally {
      _endProgress(programInfo);
    }
  }

  Future<dynamic> patch(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await _dio.patch(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on FormatException catch (_) {
      throw FormatException("Unable to process the data");
    } catch (e) {
      throw NetworkExceptions.getDioException(e);
    }
  }

  Future<dynamic> patchUri(
    Uri uri, {
    data,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    CustomTrace programInfo = CustomTrace(StackTrace.current);
    try {
      _startProgress(programInfo);
      var response = await _dio.patchUri(
        uri,
        data: data,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      _endProgress(programInfo);
      return response;
    } on FormatException catch (_) {
      throw FormatException("Unable to process the data");
    } catch (e) {
      throw NetworkExceptions.getDioException(e);
    } finally {
      _endProgress(programInfo);
    }
  }

  Future<dynamic> delete(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      var response = await _dio.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } on FormatException catch (_) {
      throw FormatException("Unable to process the data");
    } catch (e) {
      throw NetworkExceptions.getDioException(e);
    }
  }

  Future<dynamic> deleteUri(
    Uri uri, {
    data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    CustomTrace programInfo = CustomTrace(StackTrace.current);
    try {
      _startProgress(programInfo);
      var response = await _dio.deleteUri(
        uri,
        data: data,
        options: options,
        cancelToken: cancelToken,
      );
      _endProgress(programInfo);
      return response;
    } on FormatException catch (_) {
      throw FormatException("Unable to process the data");
    } catch (e) {
      throw NetworkExceptions.getDioException(e);
    } finally {
      _endProgress(programInfo);
    }
  }

  bool isLoading({String? task, List<String>? tasks}) {
    if (tasks != null) {
      return _progress.any((_task) => _progress.contains(_task));
    }
    return _progress.contains(task);
  }

  String _getTaskName(programInfo) {
    return programInfo.callerFunctionName.split('.')[1];
  }
}
