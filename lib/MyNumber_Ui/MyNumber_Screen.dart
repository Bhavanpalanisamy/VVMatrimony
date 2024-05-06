import 'package:flutter/material.dart';
import 'package:vvmatrimony/utilits/Common_Colors.dart';

import '../Common_Widgets/Common_Button.dart';
import '../Common_Widgets/Text_Form_Field.dart';
import '../utilits/Text_Style.dart';
class MyNumber extends StatefulWidget {
  const MyNumber({super.key});

  @override
  State<MyNumber> createState() => _MyNumberState();
}

class _MyNumberState extends State<MyNumber> {
  @override
  final _formkey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        backgroundColor: backGroundColor,
        title: Text('VV'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 70),
            child: Center(child: Text("My Number Is",style: Textfield_Style2,)),
          ),
          const SizedBox(height: 30,),
          Text('Well need your phone number to send an \n                OTP for verification.',style: Textfield_Style1,),
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
            padding: const EdgeInsets.only(left: 15,right: 15,bottom: 50),
            child: CommonElevatedButton(context, 'Continue', () {if(_formkey.currentState!.validate()){
            };}),
          ),
        ],
      ),
    );
  }
}
