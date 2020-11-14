import 'package:dio/dio.dart';
import 'package:elagi/models/apiResponse.dart';
import 'package:elagi/utils/sharedPref.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiHandler {
  SharedPrefs shared = new SharedPrefs();

  ///To fetch Data from the [api]
  ///with [Token]
  Future<ApiResponse> getToken({String url}) async {
    ApiResponse apiResponse;
    Dio dio = new Dio();
    dio.interceptors.clear();
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      request: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
      error: true,
      maxWidth: 90,
    ));
    final extData = await shared.read('userData');
    var token = extData['token'];
    try {
      var response = await dio.get(
        url,
        options: Options(
          sendTimeout: 5000,
          receiveTimeout: 3000,
          headers: {
            'content-type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer ' + token,
          },
        ),
      );
      consoleLogsRes(response, "GTE WITH TOKEN");
      if (response.statusCode == 200) {
        final res = response.data as Map<String, dynamic>;
        apiResponse = new ApiResponse(
          code: res['code'],
          msg: res['message'],
          object: response.data,
        );
      } else {
        apiResponse = _resException(response);
      }
    } on DioError catch (e) {
      return _dioException(e);
    } on FormatException {
      throw Exception('Format Exception ');
    } on IntegerDivisionByZeroException {
      throw Exception('IntegerDivisionByZeroException ');
    } catch (Exception) {
      throw Exception(' Unknown Exception ');
    } finally {
      dio.close();
    }
    return apiResponse;
  }

  ///To Send Data to the [api]
  ///with [Token]
  Future<ApiResponse> postToken({
    String url,
    Map<dynamic, dynamic> body,
  }) async {
    ApiResponse apiResponse;
    final extData = await shared.read('userData');
    var token = extData['token'];
    Dio dio = new Dio();
    dio.interceptors.clear();
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      request: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
      error: true,
      maxWidth: 90,
    ));
    try {
      var response = await dio.post(
        url,
        data: body,
        options: Options(
          sendTimeout: 5000,
          receiveTimeout: 3000,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer ' + token,
          },
        ),
      );

      consoleLogsRes(response, "POST WITH TOKEN");
      if (response.statusCode == 200) {
        final res = response.data as Map<String, dynamic>;
        apiResponse = new ApiResponse(
          code: res['code'],
          msg: res['message'],
          object: response.data,
        );
      } else {
        apiResponse = _resException(response);
      }
    } on DioError catch (e) {
      return _dioException(e);
    } on FormatException {
      throw Exception('Format Exception ');
    } on IntegerDivisionByZeroException {
      throw Exception('IntegerDivisionByZeroException ');
    } catch (Exception) {
      throw Exception(' Unknown Exception ');
    } finally {
      dio.close();
    }
    return apiResponse;
  }

  ///To Update Data On the [api]
  ///with [Token]
  Future<ApiResponse> putToken({
    String url,
    Map<dynamic, dynamic> body,
  }) async {
    ApiResponse apiResponse;
    Dio dio = new Dio();
    dio.interceptors.clear();
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      request: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
      error: true,
      maxWidth: 90,
    ));
    try {
      var response = await dio.put(
        url,
        data: body,
        options: Options(
          sendTimeout: 5000,
          receiveTimeout: 3000,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );
      consoleLogsRes(response, "PUT WITH TOKEN");
      if (response.statusCode == 200) {
        final res = response.data as Map<String, dynamic>;
        apiResponse = new ApiResponse(
          code: res['code'],
          msg: res['message'],
          object: response.data,
        );
      } else {
        apiResponse = _resException(response);
      }
    } on DioError catch (e) {
      return _dioException(e);
    } on FormatException {
      throw Exception('Format Exception ');
    } on IntegerDivisionByZeroException {
      throw Exception('IntegerDivisionByZeroException ');
    } catch (Exception) {
      throw Exception(' Unknown Exception ');
    } finally {
      dio.close();
    }
    return apiResponse;
  }

  ///To Delete Data From the [api]
  ///with [Token]
  Future<ApiResponse> deleteToken({String url}) async {
    ApiResponse apiResponse;
    Dio dio = new Dio();
    dio.interceptors.clear();
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      request: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
      error: true,
      maxWidth: 90,
    ));
    final extData = await shared.read('userData');
    var token = extData['token'];
    try {
      var response = await dio.delete(
        url,
        options: Options(
          sendTimeout: 5000,
          receiveTimeout: 3000,
          headers: {
            'content-type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer ' + token,
          },
        ),
      );
      consoleLogsRes(response, "DELETE WITH TOKEN");
      if (response.statusCode == 200) {
        final res = response.data as Map<String, dynamic>;
        apiResponse = new ApiResponse(
          code: res['code'],
          msg: res['message'],
          object: response.data,
        );
      } else {
        apiResponse = _resException(response);
      }
    } on DioError catch (e) {
      return _dioException(e);
    } on FormatException {
      throw Exception('Format Exception ');
    } on IntegerDivisionByZeroException {
      throw Exception('IntegerDivisionByZeroException ');
    } catch (Exception) {
      throw Exception(' Unknown Exception ');
    } finally {
      dio.close();
    }
    return apiResponse;
  }

  ///To fetch Data from the [api]
  ///without [Token]
  Future<ApiResponse> get({String url}) async {
    ApiResponse apiResponse;
    Dio dio = new Dio();
    dio.interceptors.clear();
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      request: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
      error: true,
      maxWidth: 90,
    ));
    try {
      var response = await dio.get(
        url,
        options: Options(
          sendTimeout: 5000,
          receiveTimeout: 3000,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );
      consoleLogsRes(response, "GTE WITHOUT TOKEN");
      if (response.statusCode == 200) {
        final res = response.data as Map<String, dynamic>;
        apiResponse = new ApiResponse(
          code: res['code'],
          msg: res['message'],
          object: response.data,
        );
      } else {
        apiResponse = _resException(response);
      }
    } on DioError catch (e) {
      return _dioException(e);
    } on FormatException {
      throw Exception('Format Exception ');
    } on IntegerDivisionByZeroException {
      throw Exception('IntegerDivisionByZeroException ');
    } catch (Exception) {
      throw Exception(' Unknown Exception ');
    } finally {
      dio.close();
    }
    return apiResponse;
  }

  ///To Send Data to the [api]
  ///without [Token]
  Future<ApiResponse> post({
    String url,
    Map<dynamic, dynamic> body,
  }) async {
    ApiResponse apiResponse;
    Dio dio = new Dio();
    dio.interceptors.clear();
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      request: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
      error: true,
      maxWidth: 90,
    ));
    try {
      var response = await dio.post(
        url,
        data: body,
        options: Options(
          sendTimeout: 5000,
          receiveTimeout: 3000,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );
      consoleLogsRes(response, "POST WITHOUT TOKEN");
      if (response.statusCode == 200) {
        final res = response.data as Map<String, dynamic>;
        apiResponse = new ApiResponse(
          code: res['code'],
          msg: res['message'],
          object: response.data,
        );
      } else {
        apiResponse = _resException(response);
      }
    } on DioError catch (e) {
      return _dioException(e);
    } on FormatException {
      throw Exception('Format Exception ');
    } on IntegerDivisionByZeroException {
      throw Exception('IntegerDivisionByZeroException ');
    } catch (Exception) {
      throw Exception(' Unknown Exception ');
    } finally {
      dio.close();
    }
    return apiResponse;
  }

  ///To Update Data On the [api]
  ///with [Token]
  Future<ApiResponse> put({
    String url,
    Map<dynamic, dynamic> body,
  }) async {
    ApiResponse apiResponse;
    final extData = await shared.read('userData');
    var token = extData['token'];
    Dio dio = new Dio();
    dio.interceptors.clear();
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      request: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
      error: true,
      maxWidth: 90,
    ));
    try {
      var response = await dio.put(
        url,
        data: body,
        options: Options(
          sendTimeout: 5000,
          receiveTimeout: 3000,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer ' + token,
          },
        ),
      );
      consoleLogsRes(response, "PUT WITHOUT TOKEN");
      if (response.statusCode == 200) {
        final res = response.data as Map<String, dynamic>;
        apiResponse = new ApiResponse(
          code: res['code'],
          msg: res['message'],
          object: response.data,
        );
      } else {
        apiResponse = _resException(response);
      }
    } on DioError catch (e) {
      return _dioException(e);
    } on FormatException {
      throw Exception('Format Exception ');
    } on IntegerDivisionByZeroException {
      throw Exception('IntegerDivisionByZeroException ');
    } catch (Exception) {
      throw Exception(' Unknown Exception ');
    } finally {
      dio.close();
    }
    return apiResponse;
  }

  ///To Delete Data From the [api]
  ///without [Token]
  Future<ApiResponse> delete({String url}) async {
    ApiResponse apiResponse;
    Dio dio = new Dio();
    dio.interceptors.clear();
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      request: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
      error: true,
      maxWidth: 90,
    ));
    try {
      var response = await dio.delete(
        url,
        options: Options(
          sendTimeout: 5000,
          receiveTimeout: 3000,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );
      consoleLogsRes(response, "DELETE WITHOUT TOKEN");
      if (response.statusCode == 200) {
        final res = response.data as Map<String, dynamic>;
        apiResponse = new ApiResponse(
          code: res['code'],
          msg: res['message'],
          object: response.data,
        );
      } else {
        apiResponse = _resException(response);
      }
    } on DioError catch (e) {
      return _dioException(e);
    } on FormatException {
      throw Exception('Format Exception ');
    } on IntegerDivisionByZeroException {
      throw Exception('IntegerDivisionByZeroException ');
    } catch (Exception) {
      throw Exception(' Unknown Exception ');
    } finally {
      dio.close();
    }
    return apiResponse;
  }

  ///To Print all the Exceptions on
  ///the Console Logs As [Response]
  void consoleLogsRes(Response response, String msg) {
    print("########\tSTART Console Logs Response\t########\n");
    print(response.request.path);
    print(response.request.method);
    print(response.statusCode);
    print(response.headers);
    print(response.request.responseType);
    print(response.request.data);
    print(response.data);
    print("\n########\tEND Console Logs Response\t########");
  }

  ///To Handel Dio exception
  ApiResponse _dioException(DioError exception) {
    print("*************\tSTART DioError exception\t*************\n");
    print("\n###\t\nError: ${exception.error}\n");
    print("Path: ${exception.request.path}\n");
    print("Request data: ${exception.request.data}\n");
    print("Headers: ${exception.request.headers}\n###\n");
    print("\n*************\tSTART DioError exception\t*************");
    switch (exception.type) {
      case DioErrorType.CONNECT_TIMEOUT:
        return ApiResponse(code: exception.type.index, msg: "CONNECT_TIMEOUT");
        break;
      case DioErrorType.SEND_TIMEOUT:
        return ApiResponse(code: exception.type.index, msg: "SEND_TIMEOUT");
        break;
      case DioErrorType.RECEIVE_TIMEOUT:
        return ApiResponse(code: exception.type.index, msg: "RECEIVE_TIMEOUT");
        break;
      case DioErrorType.RESPONSE:
        return ApiResponse(code: exception.type.index, msg: "RESPONSE");
        break;
      case DioErrorType.CANCEL:
        return ApiResponse(code: exception.type.index, msg: "CANCEL");
        break;
      case DioErrorType.DEFAULT:
        return ApiResponse(code: exception.type.index, msg: "DEFAULT");
        break;
      default:
        return ApiResponse(code: exception.type.index, msg: "DEFAULT");
        break;
    }
  }

  ///To handel Response exception
  ApiResponse _resException(Response response) {
    var apiResponse = new ApiResponse();
    if (response.statusCode == 200) {
      apiResponse = new ApiResponse(
        code: 1,
        object: response.data,
      );
    } else if (response.statusCode > 299 || response.statusCode < 400) {
      apiResponse = new ApiResponse(
        code: 3,
        msg: "Could not connect to server",
      );
    } else if (response.statusCode > 399 || response.statusCode < 500) {
      apiResponse = new ApiResponse(
        code: 4,
        msg: "Sorry Bad Request, Pleas Try Again Later",
      );
    } else if (response.statusCode > 499) {
      apiResponse = new ApiResponse(
        code: 5,
        msg: "Server Error",
      );
    }
    return apiResponse;
  }
}
