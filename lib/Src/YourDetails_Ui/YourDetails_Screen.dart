

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:vvmatrimony/Common_Widgets/Common_Button.dart';
import 'package:vvmatrimony/Common_Widgets/Custom_App_Bar.dart';
import 'package:vvmatrimony/Common_Widgets/Text_Form_Field.dart';
import 'package:vvmatrimony/Src/Registration_Ui/Family_Registration_Screen/Family_Registration_Screen.dart';
import 'package:vvmatrimony/utilits/Common_Colors.dart';
import 'package:vvmatrimony/utilits/Text_Style.dart';

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

  // GENDER
  String? Gender;
  List<String> Genderoption = [
    "Male",
    "Female"
  ];
  RegExp onlyText = RegExp(r'^[a-zA-Z ]+$');


  @override
  Widget build(BuildContext context) {
    void _showErrorDialog(String message) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Alert"),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () {
                  _Dob.text = "";
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    }
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: Custom_AppBar_Logo(title: '', actions: [], isNav: true,),
        body: Form(
          key: _formkey,
          child: Padding(
            padding: const EdgeInsets.only(left: 15,right: 15,top: 30),
            child: SingleChildScrollView(
              child: Container(
                // height: MediaQuery.sizeOf(context).height*1.3,
                width: MediaQuery.sizeOf(context).width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Center(child: Text("Tell about Yourself",style: Textfield_Style2,)),

                    // TEXTFROM FIELD HEADING (Name)

                    Title_Style(Title: '"Full Name"', isStatus: null,),
                    textFormField(hintText: 'Enter Your Name',
                        keyboardtype: TextInputType.text,
                        Controller: _Name,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(20),
                          FilteringTextInputFormatter.singleLineFormatter],
                      validating: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter Your Father Name";
                        }
                        else if (!onlyText.hasMatch(value)) {
                          return "Please Enter Your Father Name (Special Characters are Not Allowed)";
                        }
                        return null;
                      },
                      onChanged: null,
                    ),

                    // TEXTFORM FIELD EMAIL

                    Title_Style(Title: '"Email ID"', isStatus: null,),

                    textFormField(hintText: 'Enter Your Email',
                        keyboardtype: TextInputType.text,

                      Controller: _email,
                      inputFormatters: [
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
                    textFormField(hintText: 'Enter Your Age',
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
              TextFieldDatePicker(
                Controller: _Dob,
                onChanged: null,
                hintText: 'dd/MM/yyyy',
                onTap: () async {
                  FocusScope.of(context).unfocus();
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1950),
                    lastDate: DateTime.now(),
                  );
                  if (pickedDate != null) {
                    String formattedDate =
                    DateFormat("dd/MM/yyyy").format(pickedDate);
                    if (mounted) {
                      setState(() {
                        _Dob.text = formattedDate;
                      });
                    }
                    DateTime currentDate = DateTime.now();
                    int age = currentDate.year - pickedDate.year;
                    if (age < 18) {
                      _showErrorDialog(
                          "You must be at least 18 years old to register.");
                    }
                  }
                },
                validating: (value) {
                  if (value!.isEmpty) {
                    return 'Please Select Date of Birth';
                  } else {
                    DateTime selectedDate =
                    DateFormat("dd/MM/yyyy").parse(value);
                    DateTime currentDate = DateTime.now();
                    int age = currentDate.year - selectedDate.year;
                    if (age < 18) {
                      return 'You must be at least 18 years old to register.';
                    } else {
                      return null;
                    }
                  }
                },
              ),


                // TEXTFORM FIELD GENDER
                    Title_Style(Title: '"Gender"', isStatus: null,),
                dropDownField(
                    context,
                    hintText:"Select your Gender",
                    value: Gender,
                    listValue: Genderoption,
                    onChanged: (String? newvalue){
                      setState(() {
                        Gender = newvalue;
                      });
                      },
                ),
                    // DECSRIPTION

                    Title_Style(Title: '"About You"', isStatus: null,),
                    textfieldDescription(hintText: 'Type...'),


                    // BUTTON
                    Padding(
                      padding: const EdgeInsets.only(top: 30,bottom: 50),
                      child: CommonElevatedButton(context, 'Next', () {
                        if(_formkey.currentState!.validate()){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Family_Registration_Screen()));
                      };
                      }),
                    ),

                  ],
                ),
              ),
            ),
          ),
        ),
    );
  }

}

