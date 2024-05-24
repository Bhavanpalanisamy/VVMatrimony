import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vvmatrimony/Common_Widgets/Common_Button.dart';
import 'package:vvmatrimony/Common_Widgets/Custom_App_Bar.dart';
import 'package:vvmatrimony/Src/Home_Dashboard_Ui/Home_Dashboard_Screen.dart';
import 'package:vvmatrimony/Src/Registration_Ui/Family_Registration_Screen/Family_Registration_Screen.dart';
import 'package:vvmatrimony/Src/YourDetails_Ui/YourDetails_Screen.dart';
import 'package:vvmatrimony/utilits/ApiProvider.dart';
import 'package:vvmatrimony/utilits/ApiService.dart';
import 'package:vvmatrimony/utilits/Common_Colors.dart';
import 'package:vvmatrimony/utilits/ConstantsApi.dart';
import 'package:vvmatrimony/utilits/Generic.dart';
import 'package:vvmatrimony/utilits/Loading_Overlay.dart';
import 'package:vvmatrimony/utilits/Text_Style.dart';

class OTP extends ConsumerStatefulWidget {
  final String mobileNumber;
  final bool isPhoneVerification;
   OTP({super.key,required this.mobileNumber,required this.isPhoneVerification});

  @override
  ConsumerState<OTP> createState() => _OTPState();
}

class _OTPState extends ConsumerState<OTP> {
  final _formkey = GlobalKey<FormState>();



  int _timeLeft = 30; // Timer duration in seconds
  bool _isTimerActive = false;

  void _tick() {
    if (_timeLeft == 0) {
      setState(() {
        _isTimerActive = false;
      });
    } else {
      setState(() {
        _timeLeft--;
      });
    }
  }

  // Start the timer
  void _startTimer() {
    setState(() {
      _timeLeft = 30;
      _isTimerActive = true;
    });

    Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (_isTimerActive) {
        _tick();
      } else {
        timer.cancel();
      }
    });
  }

  // var controllers;
  var output;
  TextEditingController _OTP1 = TextEditingController();
  TextEditingController _OTP2 = TextEditingController();
  TextEditingController _OTP3 = TextEditingController();
  TextEditingController _OTP4 = TextEditingController();

  Widget _textFieldOTP({bool? first, bool? last, controllers}) {
    return Container(
      height: 60,
      width: 50,

      // margin: EdgeInsets.only(left: 10),
      child: TextFormField(
        controller: controllers,
        autofocus: true,
        maxLength: 1,
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
          if (value.length == 0) {
            setState(() {
              FocusScope.of(context).previousFocus();
            });
          }
        },
        showCursor: true,
        textAlign: TextAlign.center,
        // style: OtpTextfield_Style,
        keyboardType: TextInputType.number,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
        decoration: InputDecoration(
          fillColor: white1,
          filled: true,
          counter: Offstage(),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: pink1),
              borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: pink1),
              borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: Custom_AppBar_Logo(title: '', actions: [], isNav: true,),
      body: Form(
        key: _formkey,
        child: Padding(
          padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
          child: Column(
              children: [

                Code(text: 'Verification Code', style: Textfield_Style2),
                Code(text: 'Please enter code we just send to', style: sub_ContentST),
                Code1(text: '+91-${widget.mobileNumber}', style: Textfield_Style1),

                // OTP
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _textFieldOTP(first: true, last: true, controllers: _OTP1),
                    _textFieldOTP(first: true, last: true, controllers: _OTP2),
                    _textFieldOTP(first: true, last: true, controllers: _OTP3),
                    _textFieldOTP(first: true, last: true, controllers: _OTP4),
                  ],
                ),

                // ON TAP TEXT
                ontap1(text: 'Didn’t receive OTP?', style: onClicked_TextC),
                InkWell(
                  onTap: (){
                    ResendVerificationApiResponse();
                    _startTimer();
                  },
                    child: Text(
                      _isTimerActive
                          ? 'Resend OTP'
                          : 'Resend OTP',
                      style: TextStyle(
                          color: _isTimerActive
                              ? red1
                              : Color.fromRGBO(34, 152, 255, 1),
                          fontFamily: 'Inter',
                          fontSize: 14,
                          fontWeight: FontWeight.w400
                      ),
                    ),
                    ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                      _isTimerActive ? "00:$_timeLeft" :
                      "",
                      // style: changeT,
                      style: TextStyle(color: red1)
                  ),
                ),

                const Spacer(),

                // BUTTON
                Padding(
                  padding: const EdgeInsets.only(left: 15,right: 15,bottom: 50),
                  child: CommonElevatedButton(context, 'Verify', () {
                    if(_formkey.currentState!.validate()){
                    OtpVerificationApiResponse();
                  };

                  }),
                ),
              ],
          ),
        ),
      ),

    );
  }
  //OTP VERIFICATION API RESPONSE
  OtpVerificationApiResponse() async{
    var formData = FormData.fromMap({
      "user_id":await getuserId(),
      "otp":"${_OTP1.text}${_OTP2.text}${_OTP3.text}${_OTP4.text}"
    });
   final OtpResponse = await ref.watch(widget.isPhoneVerification == true? phoneVerficationProvider(formData).future:otpVerificationProvider(formData).future);
    LoadingOverlay.show(context);

    if(OtpResponse?.status == true){
      LoadingOverlay.hide();

      print("OTP VERIFICATION SUCCESS");
      ShowToastMessage(OtpResponse?.message ?? "");
      Navigator.push(context, MaterialPageRoute(builder: (context) => widget.isPhoneVerification == true?Family_Registration_Screen():HomeDashboard()));
    }else{
      LoadingOverlay.hide();

      print("OTP VERIFICATION ERROR");
      ShowToastMessage(OtpResponse?.message ?? "");
    }
  }

  //OTP RESEND VERIFICATION
  ResendVerificationApiResponse() async{
    var formData = FormData.fromMap({
      "user_id":await getuserId(),
    });
    final ResendOtpResponse = await ref.watch(resendOtpProvider(formData).future);
    LoadingOverlay.show(context);

    if(ResendOtpResponse?.status == true){
      LoadingOverlay.hide();

      print("RESEND OTP VERIFICATION SUCCESS");
      ShowToastMessage(ResendOtpResponse?.message ?? "");
      // Navigator.push(context, MaterialPageRoute(builder: (context) => HomeDashboard()));
    }else{
      LoadingOverlay.hide();

      print("RESEND OTP VERIFICATION ERROR");
      ShowToastMessage(ResendOtpResponse?.message ?? "");
    }
  }
}

Widget ontap1({required String text , required dynamic style}){
  return Padding(
    padding: const EdgeInsets.only(top: 20),
    child: Text(text,style: style,),
  );
}

Widget Code ({required String text , required dynamic style}){
  return Padding(
    padding: const EdgeInsets.only(top: 10),
    child: Center(child: Text(text,style: style,textAlign: TextAlign.center, maxLines: 2,)),
  );
}

Widget Code1 ({required String text , required dynamic style}){
  return Padding(
    padding: const EdgeInsets.only(bottom: 20),
    child: Center(child: Text(text,style: style,textAlign: TextAlign.center, maxLines: 2,)),
  );
}

Widget Underlinetext (){
  return Padding(
    padding: const EdgeInsets.only(top: 10),
    child: Text("Resend Code",style: TextStyle(
      decoration: TextDecoration.underline,
      decorationColor: pink1,
      color: pink1,
    ),),
  );
}



