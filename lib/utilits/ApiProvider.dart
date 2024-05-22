



import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vvmatrimony/Model/HomeDashBoardModel.dart';
import 'package:vvmatrimony/Model/LoginModel.dart';
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

//REGISTERATION 1
final registration1Provider = FutureProvider.autoDispose
    .family<LoginModel?, FormData>((ref, formData) async {
  return ref.watch(apiServiceProvider).registrationService(formData);
});

//REGISTERATION 2
final registration2Provider = FutureProvider.autoDispose
    .family<LoginModel?, FormData>((ref, formData) async {
  return ref.watch(apiServiceProvider).registrationService2(formData);
});

//REGISTERATION 3
final registration3Provider = FutureProvider.autoDispose
    .family<LoginModel?, FormData>((ref, formData) async {
  return ref.watch(apiServiceProvider).registrationService3(formData);
});

//REGISTERATION 4
final registration4Provider = FutureProvider.autoDispose
    .family<LoginModel?, FormData>((ref, formData) async {
  return ref.watch(apiServiceProvider).registrationService4(formData);
});

//REGISTERATION 5
final registration5Provider = FutureProvider.autoDispose
    .family<LoginModel?, FormData>((ref, formData) async {
  return ref.watch(apiServiceProvider).registrationService5(formData);
});

//REGISTERATION 6
final registration6Provider = FutureProvider.autoDispose
    .family<LoginModel?, FormData>((ref, formData) async {
  return ref.watch(apiServiceProvider).registrationService6(formData);
});

//REGISTERATION 7
final registration7Provider = FutureProvider.autoDispose
    .family<LoginModel?, FormData>((ref, formData) async {
  return ref.watch(apiServiceProvider).registrationService7(formData);
});

//HOME DASH BOARD API PROVIDER
final homeDashBoardProvider =
FutureProvider.autoDispose<HomeDashBoardModel?>((ref) async {
  var formData = FormData.fromMap({
    "user_id": await getuserId(),
  });
  return ref.watch(apiServiceProvider).homeDashBoardApiService(formData);
});



