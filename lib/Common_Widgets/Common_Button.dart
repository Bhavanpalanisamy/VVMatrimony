import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utilits/ApiService.dart';
import '../utilits/Common_Colors.dart';
import '../utilits/Text_Style.dart';
import 'Image_Path.dart';



// ELEVATED BUTTON
Widget CommonElevatedButton(
  BuildContext context,
  String titleName,
  void Function()? onPress,
){
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: pink1,
      minimumSize: Size(double.infinity, 60),
      elevation: 9,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
    ),
    onPressed: onPress,
    child: Text(
      titleName,
      style: ButtonT,
    ),
  );
}


//CALL BUTTON
Widget Call_Button(context,{required void Function()? onPress,required String ButtonText }){
  return InkWell(
    onTap: onPress,
    child: Container(
      height: 60,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: pink1),

      // INSIDE BUTTON
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(),
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: white1),
              child: Icon(Icons.phone,color: pink1,size: 30,),
            ),
          ),
          Center(child: Text(ButtonText,style: ButtonT,)),
        ],
      ),
    ),
  );
}

//SIGN UP
Widget Sign_Up({required void Function()? onPress}){
  return   Padding(
    padding: const EdgeInsets.only(left: 60,right: 60,bottom: 30,top: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don’t have an account?",style: onClicked_TextC,),
        InkWell(
          onTap: onPress,
            child: Text("Sign Up",style: onClicked_TextB,))
      ],
    ),
  );
}





