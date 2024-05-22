import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vvmatrimony/Model/HomeDashBoardModel.dart';
import 'package:vvmatrimony/Model/LoginModel.dart';


import 'ConstantsApi.dart';
import 'Generic.dart';
import 'Loading_Overlay.dart';
import 'MakeApiCall.dart';


final dioProvider = Provider<Dio>((ref) {
  final dio = Dio();
  dio.interceptors.add(LogInterceptor(responseBody: true)); // For debugging
  return dio;
});

class ApiService {
  final Dio _dio;
  ApiService(this._dio);

  T _fromJson<T>(dynamic json) {
    if (json != null) {
      if (T == LoginModel) {
        return LoginModel.fromJson(json) as T;
      }
    } else {
      final jsonResponse = {
        'status': false,
        'message': ConstantApi.SOMETHING_WRONG, //Server not responding
      };
      json = jsonResponse;
    }

    // Add more conditionals for other model classes as needed
    throw Exception("Unknown model type");
  }

  Future<T> _requestGET<T>(BuildContext context, String path) async {
    try {
      final response = await _dio.get(path);
      return _fromJson<T>(response.data);
    } on DioException catch (e) {
      // Handle DioError, you can log or display an error message.
      return _fromJson<T>(e.response?.data);
    } catch (e) {
      // Handle other exceptions here
      throw e;
    }
  }

  Future<T> _requestPOST<T>(
      String path, {
        FormData? data,
      }) async {
    try {
      final response = await _dio.post(path, data: data);

      return _fromJson<T>(response.data);
    } on DioException catch (e) {
      // Handle DioError, you can log or display an error message.

      return _fromJson<T>(e.response?.data);
    } catch (e) {
      // Handle other exceptions here

      throw e;
    }
  }

  Future<T> _requestPOST1<T>(
      String path, {
        Map<String, dynamic>? data,
      }) async {
    try {
      final response = await _dio.post(path, data: data);

      return _fromJson<T>(response.data);
    } on DioException catch (e) {
      // Handle DioError, you can log or display an error message.

      return _fromJson<T>(e.response?.data);
    } catch (e) {
      // Handle other exceptions here

      throw e;
    }
  }

  Future<T> _requestPOST2<T>(
      String path, {
        FormData? data,
      }) async {
    try {
      final response = await _dio.put(path, data: data);

      return _fromJson<T>(response.data);
    } on DioException catch (e) {
      // Handle DioError, you can log or display an error message.

      return _fromJson<T>(e.response?.data);
    } catch (e) {
      // Handle other exceptions here

      throw e;
    }
  }

  Future<dynamic> get<T>(BuildContext context, String path) async {
    return _requestGET<T>(context, path);
  }

  Future<T> post<T>(String path, FormData data) async {
    return _requestPOST<T>(path, data: data);
  }

  Future<T> post1<T>(String path, Map<String, dynamic> data) async {
    return _requestPOST1<T>(path, data: data);
  }

  Future<T> post2<T>(String path, FormData data) async {
    return _requestPOST2<T>(path, data: data);
  }

  //LOGIN API RESPONSE
  Future<LoginModel> loginUser(FormData formData) async {
    final result = await requestPOST(
        url: ConstantApi.loginUrl, formData: formData, dio: _dio);

    if (result["success"] == true) {

      print("resultOTP:$result");
      print("resultOTPsss:${result["success"]}");
      return LoginModel?.fromJson(result["response"]);
    } else {
      try {

        var resultval = LoginModel.fromJson(result["response"]);
        // Toast.show(resultval.message.toString(), context);
        print(result["response"]);
        return resultval;
      } catch (e) {

        print(result["response"]);
        ShowToastMessage(result['response']);

        // Toast.show(result["response"], context);
      }
    }
    return LoginModel();
  }
  //REGISTRATION API
  Future<LoginModel> registrationService(FormData formData) async {
    final result = await requestPOST(
        url: ConstantApi.registrationUrl1, formData: formData, dio: _dio);
    if (result["success"] == true) {
      print("resultOTP:$result");
      print("resultOTPsss:${result["success"]}");
      return LoginModel?.fromJson(result["response"]);
    } else {
      try {
        var resultval = LoginModel.fromJson(result["response"]);
        // Toast.show(resultval.message.toString(), context);
        print(result["response"]);
        return resultval;
      } catch (e) {

        print(result["response"]);
        ShowToastMessage(result['response']);

        // Toast.show(result["response"], context);
      }
    }
    return LoginModel();
  }

  //FAMILY REGISTRATION
  Future<LoginModel> registrationService2(FormData formData) async {
    final result = await requestPOST(
        url: ConstantApi.registrationUrl2, formData: formData, dio: _dio);
    if (result["success"] == true) {
      print("resultOTP:$result");
      print("resultOTPsss:${result["success"]}");

      return LoginModel?.fromJson(result["response"]);
    } else {
      try {
        var resultval = LoginModel.fromJson(result["response"]);

        // Toast.show(resultval.message.toString(), context);
        print(result["response"]);
        return resultval;
      } catch (e) {
        print(result["response"]);

        // Toast.show(result["response"], context);
      }
    }
    return LoginModel();
  }

  //COMMUNITY REGISTRATION
  Future<LoginModel> registrationService3(FormData formData) async {
    final result = await requestPOST(
        url: ConstantApi.registrationUrl3, formData: formData, dio: _dio);
    if (result["success"] == true) {
      print("resultOTP:$result");
      print("resultOTPsss:${result["success"]}");

      return LoginModel?.fromJson(result["response"]);
    } else {
      try {
        var resultval = LoginModel.fromJson(result["response"]);
        // Toast.show(resultval.message.toString(), context);
        print(result["response"]);
        return resultval;
      } catch (e) {
        print(result["response"]);

        // Toast.show(result["response"], context);
      }
    }
    return LoginModel();
  }

  //PERSONAL INFORMATION API
  Future<LoginModel> registrationService4(FormData formData) async {
    final result = await requestPOST(
        url: ConstantApi.registrationUrl4, formData: formData, dio: _dio);
    if (result["success"] == true) {
      print("resultOTP:$result");
      print("resultOTPsss:${result["success"]}");
      return LoginModel?.fromJson(result["response"]);
    } else {
      try {
        var resultval = LoginModel.fromJson(result["response"]);
        // Toast.show(resultval.message.toString(), context);
        print(result["response"]);
        return resultval;
      } catch (e) {
        print(result["response"]);

        // Toast.show(result["response"], context);
      }
    }
    return LoginModel();
  }

  //HOROSCOPE REGISTRATION
  Future<LoginModel> registrationService5(FormData formData) async {
    final result = await requestPOST(
        url: ConstantApi.registrationUrl5, formData: formData, dio: _dio);
    if (result["success"] == true) {
      print("resultOTP:$result");
      print("resultOTPsss:${result["success"]}");

      return LoginModel?.fromJson(result["response"]);
    } else {
      try {
        var resultval = LoginModel.fromJson(result["response"]);

        // Toast.show(resultval.message.toString(), context);
        print(result["response"]);
        return resultval;
      } catch (e) {
        print(result["response"]);

        // Toast.show(result["response"], context);
      }
    }
    return LoginModel();
  }

  //COMMUNITY REGISTRATION
  Future<LoginModel> registrationService6(FormData formData) async {
    final result = await requestPOST(
        url: ConstantApi.registrationUrl6, formData: formData, dio: _dio);
    if (result["success"] == true) {
      print("resultOTP:$result");
      print("resultOTPsss:${result["success"]}");

      return LoginModel?.fromJson(result["response"]);
    } else {
      try {
        var resultval = LoginModel.fromJson(result["response"]);
        // Toast.show(resultval.message.toString(), context);
        print(result["response"]);
        return resultval;
      } catch (e) {
        print(result["response"]);

        // Toast.show(result["response"], context);
      }
    }
    return LoginModel();
  }

  //EXPECTATION REGISTRATION
  Future<LoginModel> registrationService7(FormData formData) async {
    final result = await requestPOST(
        url: ConstantApi.registrationUrl7, formData: formData, dio: _dio);
    if (result["success"] == true) {

      print("resultOTP:$result");
      print("resultOTPsss:${result["success"]}");
      return LoginModel?.fromJson(result["response"]);
    } else {
      try {
        var resultval = LoginModel.fromJson(result["response"]);
        // Toast.show(resultval.message.toString(), context);
        print(result["response"]);
        return resultval;
      } catch (e) {
        LoadingOverlay.hide();
        print(result["response"]);

        // Toast.show(result["response"], context);
      }
    }
    return LoginModel();
  }

  //OTP VERIFICATION SCREEN
  Future<LoginModel> otpApiService(FormData formData) async {
    final result = await requestPOST(
        url: ConstantApi.otpVerificationUrl, formData: formData, dio: _dio);
    if (result["success"] == true) {
      print("resultOTP:$result");
      print("resultOTPsss:${result["success"]}");
      return LoginModel?.fromJson(result["response"]);
    } else {
      try {
        var resultval = LoginModel.fromJson(result["response"]);
        // Toast.show(resultval.message.toString(), context);
        print(result["response"]);
        return resultval;
      } catch (e) {
        print(result["response"]);

        // Toast.show(result["response"], context);
      }
    }
    return LoginModel();
  }

  //OTP VERIFICATION SCREEN
  Future<LoginModel> phoneApiService(FormData formData) async {
    final result = await requestPOST(
        url: ConstantApi.phoneNumberVerificationUrl, formData: formData, dio: _dio);
    if (result["success"] == true) {

      print("resultOTP:$result");
      print("resultOTPsss:${result["success"]}");

      return LoginModel?.fromJson(result["response"]);
    } else {
      try {
        var resultval = LoginModel.fromJson(result["response"]);
        // Toast.show(resultval.message.toString(), context);
        print(result["response"]);
        return resultval;
      } catch (e) {
        print(result["response"]);

        // Toast.show(result["response"], context);
      }
    }
    return LoginModel();
  }

  //RESEND OTP VERIFICATION SCREEN
  Future<LoginModel> resendOtpApiService(context,FormData formData) async {
    final result = await requestPOST(
        url: ConstantApi.otpResentUrl, formData: formData, dio: _dio);
    LoadingOverlay.show(context);
    if (result["success"] == true) {
      LoadingOverlay.hide();

      print("resultOTP:$result");
      print("resultOTPsss:${result["success"]}");

      return LoginModel?.fromJson(result["response"]);
    } else {
      try {
        LoadingOverlay.hide();
        var resultval = LoginModel.fromJson(result["response"]);
        // Toast.show(resultval.message.toString(), context);
        print(result["response"]);
        return resultval;
      } catch (e) {
        LoadingOverlay.hide();
        print(result["response"]);

        // Toast.show(result["response"], context);
      }
    }
    return LoginModel();
  }

  //HOME DASH BOARD API RESPONSE
  Future<HomeDashBoardModel> homeDashBoardApiService(FormData formData) async {
    final result = await requestPOST(
        url: ConstantApi.homeDashBaordUrl, formData: formData, dio: _dio);
    if (result["success"] == true) {
      LoadingOverlay.hide();

      print("resultOTP:$result");
      print("resultOTPsss:${result["success"]}");

      return HomeDashBoardModel?.fromJson(result["response"]);
    } else {
      try {
        var resultval = HomeDashBoardModel.fromJson(result["response"]);
        // Toast.show(resultval.message.toString(), context);
        print(result["response"]);
        return resultval;
      } catch (e) {
        print(result["response"]);

        // Toast.show(result["response"], context);
      }
    }
    return HomeDashBoardModel();
  }

}


