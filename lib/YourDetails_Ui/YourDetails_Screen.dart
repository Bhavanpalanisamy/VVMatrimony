import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vvmatrimony/GetStarted_Ui/GetStarted_Screen.dart';

import '../Common_Widgets/Common_Button.dart';
import '../Common_Widgets/Text_Form_Field.dart';
import '../utilits/Common_Colors.dart';
import '../utilits/Text_Style.dart';
class Yourdetails extends StatefulWidget {
  const Yourdetails({super.key});

  @override
  State<Yourdetails> createState() => _YourdetailsState();
}

class _YourdetailsState extends State<Yourdetails> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController _Name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _Age = TextEditingController();
  TextEditingController _Dob = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        backgroundColor: backGroundColor,
        title: Text('VV'),
      ),
        body: Form(
          key: _formkey,
          child: Padding(
            padding: const EdgeInsets.only(left: 15,right: 15,top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            Center(child: Text("Tell about Yourself",style: Textfield_Style2,)),

                // TEXTFROM FIELD HEADING (Name)

                Title_Style(Title: '"Full Name"', isStatus: null,),
                textFormField2(hintText: 'Enter Your Name',
                    keyboardtype: TextInputType.text,
                    Controller: _Name,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(20),
                      FilteringTextInputFormatter.singleLineFormatter],
                    onChanged: null,
                    validating:(value){
                      if (value!.isEmpty) {
                        return 'Please Enter Name';
                      }
                    }
                ),

                // TEXTFORM FIELD EMAIL

                Title_Style(Title: '"Email ID"', isStatus: null,),

                textFormField2(hintText: 'Enter Your Email',
                    keyboardtype: TextInputType.text,

                  Controller: _email,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(25),
                    FilteringTextInputFormatter.singleLineFormatter],
                  onChanged: null,
                  validating: (value){
                    if(value==null||value.isEmpty){
                      return "Enter Email";
                    }else if(!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)){
                      return "Please Enter valid Email ";
                    }else{
                      return null;
                    }
                  },
                ),

                // TEXTFORM FILED AGE

                Title_Style(Title: '"Your Age"', isStatus: null,),
                textFormField2(hintText: 'Enter Your Age',
                    keyboardtype: TextInputType.number,
                    Controller: _Age,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(2),
                      FilteringTextInputFormatter.digitsOnly],
                    onChanged: null,
                    validating:(value){
                      if (value!.isEmpty) {
                        return 'Please Enter Age';
                      }
                    }
                ),

            // TEXTFORM FIELD DOB

                Title_Style(Title: '"Date of Birth"', isStatus: null,),
                TextFieldDatePicker(hintText: 'Enter Your Date of Birth',
                  Controller: _Dob,
                ),

            // TEXTFORM FIELD GENDER
                Title_Style(Title: '"Gender"', isStatus: null,),


            const Spacer(),

                // BUTTON

                Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: CommonElevatedButton(context, 'Continue', () {if(_formkey.currentState!.validate()){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => GetStarted()));
                  };}),
                ),

              ],
            ),
          ),
        ),
    );
  }
}


