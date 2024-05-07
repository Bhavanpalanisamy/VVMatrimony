import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vvmatrimony/OTP_Ui/OTP_Screen.dart';
import 'package:vvmatrimony/utilits/Common_Colors.dart';

import '../Common_Widgets/Common_Button.dart';
import '../Common_Widgets/Text_Form_Field.dart';
import '../utilits/Text_Style.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController _MobileNumber = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        backgroundColor: backGroundColor,
        title: Text('VV'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 70),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: Text("Let’s start with your \n          number",style: Textfield_Style2,)),

            //TEXTFORM FIELD
        const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 15,right: 15),
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
              padding: const EdgeInsets.only(left: 15,right: 15),
              child: CommonElevatedButton(context, 'Continue', () {if(_formkey.currentState!.validate()){
                Navigator.push(context, MaterialPageRoute(builder: (context) => OTP()));
              };}),
            ),
            const SizedBox(height: 30),
            Text("OR"),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don’t have an account?',style: onClicked_TextC,),
                  Text(' Sign Up',style: onClicked_TextB,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
