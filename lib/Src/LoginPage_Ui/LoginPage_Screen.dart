

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vvmatrimony/Common_Widgets/Common_Button.dart';
import 'package:vvmatrimony/Common_Widgets/Image_Picker.dart';
import 'package:vvmatrimony/Common_Widgets/Text_Form_Field.dart';
import 'package:vvmatrimony/Model/LoginModel.dart';
import 'package:vvmatrimony/Src/Home_Dashboard_Ui/Home_Dashboard_Screen.dart';
import 'package:vvmatrimony/Src/OTP_Ui/OTP_Screen.dart';
import 'package:vvmatrimony/Src/YourDetails_Ui/YourDetails_Screen.dart';
import 'package:vvmatrimony/utilits/ApiService.dart';
import 'package:vvmatrimony/utilits/Common_Colors.dart';
import 'package:vvmatrimony/utilits/ConstantsApi.dart';
import 'package:vvmatrimony/utilits/Generic.dart';
import 'package:vvmatrimony/utilits/Loading_Overlay.dart';
import 'package:vvmatrimony/utilits/Text_Style.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController _MobileNumber = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Small_Logo(),

            // LETS START

            Letsstart(),

            //TEXTFORM FIELD

            Padding(
              padding: const EdgeInsets.only(left: 15,right: 15,top: 100),
              child: Form(
                  key: _formkey,
                  child: textFormField(hintText: 'Enter phone number',
                      keyboardtype: TextInputType.phone,
                      Controller: _MobileNumber,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(10),
                        FilteringTextInputFormatter.digitsOnly],
                      onChanged: null,
                      validating:(value){
                        if (value!.isEmpty) {
                          return 'Please enter a mobile number';
                        } else if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                          return 'Please enter a valid 10-digit mobile number';
                        }
                        return null;
                      }
                  )),
            ),
            const Spacer(),

            // BUTTON

            Padding(
              padding: const EdgeInsets.only(left: 15,right: 15,bottom: 30),
              child: CommonElevatedButton(context, 'Login', () {
                if(_formkey.currentState!.validate()){
                  LoginApiResponse();
              };}),
            ),

            Text("OR"),

            // ON CLICK TEXT
            Sign_Up(onPress: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Yourdetails()));
            }),
          ],
        ),
      ),
    );
  }
  LoginApiResponse() async{
    final loginApiService = ApiService(ref.watch(dioProvider));
    var formData = FormData.fromMap({
      "mobile":_MobileNumber.text,
    });

    final LoginResponse = await loginApiService.post<LoginModel>(ConstantApi.loginUrl, formData);

    LoadingOverlay.show(context);

    if(LoginResponse?.status == true){
      LoadingOverlay.hide();
      ShowToastMessage(LoginResponse?.message ?? "");
      UserId(LoginResponse?.userId ?? "");
      print("USER ID :: ${LoginResponse?.userId ?? ""}");
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomeDashboard()), (route) => false);
    }else{
      LoadingOverlay.hide();
      ShowToastMessage(LoginResponse?.message ?? "");
      print('ERROR');
    }
  }

}

Widget Letsstart(){
  return Text(
    'Let’s start with your number',
    style: Textfield_Style2,
    maxLines: 2,
    textAlign: TextAlign.center,
  );
}

