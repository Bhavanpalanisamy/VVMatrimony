import 'package:flutter/material.dart';
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
                  child: textFormField(hintText: 'Enter phone number', keyboardtype: TextInputType.phone,)),
            ),
            const Spacer(),

            // BUTTON

            Padding(
              padding: const EdgeInsets.only(left: 15,right: 15),
              child: CommonElevatedButton(context, 'Continue', () {if(_formkey.currentState!.validate()){
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
