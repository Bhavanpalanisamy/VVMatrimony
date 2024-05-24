



import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vvmatrimony/Model/HomeDashBoardModel.dart';
import 'package:vvmatrimony/Model/LogOutModel.dart';
import 'package:vvmatrimony/Model/LoginModel.dart';
import 'package:vvmatrimony/Model/UserDetailModel.dart';
import 'package:vvmatrimony/utilits/ApiService.dart';
import 'package:vvmatrimony/utilits/Generic.dart';

final apiServiceProvider = Provider<ApiService>((ref) {
  final dio = ref.read(dioProvider);
  return ApiService(dio);
});



//LOGIN
final loginProvider = FutureProvider.autoDispose
    .family<LoginModel?, FormData>((ref, formData) async {
  return ref.watch(apiServiceProvider).loginUser(formData);
});

//OTP VERIFICATION PROVIDER
final otpVerificationProvider = FutureProvider.autoDispose
    .family<LoginModel?, FormData>((ref, formData) async {
  return ref.watch(apiServiceProvider).otpApiService(formData);
});
//PHONE VERIFICATION
final phoneVerficationProvider = FutureProvider.autoDispose
    .family<LoginModel?, FormData>((ref, formData) async {
  return ref.watch(apiServiceProvider).phoneApiService(formData);
});

//REGISTRATION 8 API PROVIDER
//PHONE VERIFICATION
final registration8Provider = FutureProvider.autoDispose
    .family<LoginModel?, FormData>((ref, formData) async {
  return ref.watch(apiServiceProvider).registrationService8(formData);
});

//RESEND API PROVIDER
final resendOtpProvider = FutureProvider.autoDispose
    .family<LoginModel?, FormData>((ref, formData) async {
  return ref.watch(apiServiceProvider).resendOtpApiService(formData);
});

//HOME DASH BOARD API PROVIDER
final homeDashBoardProvider = FutureProvider.autoDispose<HomeDashBoardModel?>((ref) async {
  var formData = FormData.fromMap({
    "user_id": await getuserId(),
  });
  return ref.watch(apiServiceProvider).homeDashBoardApiService(formData);
});

//USERDETAIL API PROVIDER
final userDetailProvider = FutureProvider.autoDispose
    .family<UserDetailModel?, FormData>((ref, formData) async {
  return ref.watch(apiServiceProvider).userDetailApiService(formData);
});

//LOGOUT API PROVIDER
final logOutProvider = FutureProvider.autoDispose<LogOutModel?>((ref) async {
  return ref.watch(apiServiceProvider).logOutApiService();
});

