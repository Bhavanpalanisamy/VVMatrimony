import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vvmatrimony/Common_Widgets/Common_Button.dart';
import 'package:vvmatrimony/Common_Widgets/Image_Picker.dart';
import 'package:vvmatrimony/Common_Widgets/Text_Form_Field.dart';
import 'package:vvmatrimony/Src/OTP_Ui/OTP_Screen.dart';
import 'package:vvmatrimony/utilits/Common_Colors.dart';
import 'package:vvmatrimony/utilits/Text_Style.dart';

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
              padding: const EdgeInsets.only(left: 15,right: 15,top: 30),
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
              child: CommonElevatedButton(context, 'Next', () {if(_formkey.currentState!.validate()){
                Navigator.push(context, MaterialPageRoute(builder: (context) => OTP()));
              };}),
            ),

            Text("OR"),

            // ON CLICK TEXT
            Sign_Up(onPress: () {}),
          ],
        ),
      ),
    );
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

