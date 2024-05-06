import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Common_Widgets/Common_Button.dart';
import '../utilits/Common_Colors.dart';
import '../utilits/Text_Style.dart';
class OTP extends StatefulWidget {
  const OTP({super.key});

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
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
        padding: const EdgeInsets.only(left: 15,right: 15),
        child: Column(
            children: [
        Padding(
        padding: const EdgeInsets.only(top: 70),
        child: Center(child: Text("My Number Is",style: Textfield_Style2,)),
            ),
              const SizedBox(height: 30,),
              Text('Please enter code we just send to',style: Textfield_Style1,),
              const SizedBox(height: 40,),
              // OTP
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(height: 60,width: 60,
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: white1),
                        ),
                      ),
                      onChanged: (value){
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      style: Theme.of(context).textTheme.headline6,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                  ),
                  SizedBox(height: 60,width: 60,
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: white1),
                        ),
                      ),
                      onChanged: (value){
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      style: Theme.of(context).textTheme.headline6,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                  ),
                  SizedBox(height: 60,width: 60,
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: white1),
                        ),
                      ),
                      onChanged: (value){
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      style: Theme.of(context).textTheme.headline6,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                  ),
                  SizedBox(height: 60,width: 60,
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: white1),

                        ),
                      ),
                      onChanged: (value){
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      style: Theme.of(context).textTheme.headline6,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25,),

              Text('Didn’t receive OTP?',style: onClicked_TextC,),
              const SizedBox(height: 10,),
              Text('Resend Code',style: onClicked_TextB,),
              const Spacer(),

              // BUTTON

              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: CommonElevatedButton(context, 'Continue', () {if(_formkey.currentState!.validate()){
                };}),
              ),
            ],
        ),
      ),

    );
  }
}
