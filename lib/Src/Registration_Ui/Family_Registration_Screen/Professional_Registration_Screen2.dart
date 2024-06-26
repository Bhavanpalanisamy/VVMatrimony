import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vvmatrimony/Src/Registration_Ui/Family_Registration_Screen/Expectation_Registration_Screen.dart';
import 'package:vvmatrimony/utilits/ApiProvider.dart';
import 'package:vvmatrimony/utilits/Common_Colors.dart';
import 'package:vvmatrimony/utilits/Loading_Overlay.dart';

import '../../../Common_Widgets/Common_Button.dart';
import '../../../Common_Widgets/Custom_App_Bar.dart';
import '../../../Common_Widgets/Text_Form_Field.dart';
import '../../../utilits/ApiService.dart';
import '../../../utilits/Generic.dart';
import '../../../utilits/Text_Style.dart';
class Professional_Registration_Screen2 extends ConsumerStatefulWidget {
  const Professional_Registration_Screen2({super.key});

  @override
  ConsumerState<Professional_Registration_Screen2> createState() => _Professional_Registration_Screen2State();
}

class _Professional_Registration_Screen2State extends ConsumerState<Professional_Registration_Screen2> {
  //EMPLOYEE IN
  String? employeeVal;
  List<String> employeeOption = [
    "Government",
    "Private",
  ];

  TextEditingController _Education = TextEditingController();
  TextEditingController _CompanyName = TextEditingController();
  TextEditingController _Occupation = TextEditingController();
  TextEditingController _AnnualIncome = TextEditingController();
  TextEditingController _WorkLocation = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: Custom_AppBar_Logo(title: '', actions: [], isNav: true,),
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Head_Text(HeadText: 'Tell about Some Professional'),
          
              //EDUCTION
              Title_Style(Title: 'Education', isStatus: null),
              textFormField(
                hintText: 'Enter Your Education',
                keyboardtype: TextInputType.text,
                inputFormatters: null,
                Controller: _Education,
                validating: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter Your Education";
                  }
                  else if (value == null) {
                    return "Please Enter Your Education";
                  }
                  return null;
                },
                onChanged: null,
              ),
          
              //EMPLOYEE IN
              Title_Style(Title: 'Employeed In', isStatus: null),
              dropDownField(
                context,
                hintText: 'Select',
                value: employeeVal,
                listValue: employeeOption,
                onChanged: (String? newValue) {
                  setState(() {
                    employeeVal = newValue;
                  });
                },
              ),
          
              // COMPANY NAME
              Title_Style(Title: 'Company Name', isStatus: null),
              textFormField(
                hintText: 'Enter Your Company Name',
                keyboardtype: TextInputType.text,
                inputFormatters: null,
                Controller: _CompanyName,
                validating: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter Your Company Name";
                  }
                  else if (value == null) {
                    return "Please Enter Your Company Name";
                  }
                  return null;
                },
                onChanged: null,
              ),
          
              // OCCUPATION
              Title_Style(Title: 'Occupation', isStatus: null),
              textFormField(
                hintText: 'Enter Your Occupation',
                keyboardtype: TextInputType.text,
                inputFormatters: null,
                Controller: _Occupation,
                validating: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter Your Occupation";
                  }
                  else if (value == null) {
                    return "Please Enter Your Occupation";
                  }
                  return null;
                },
                onChanged: null,
              ),
          
              //ANNUAL INCOME
              Title_Style(Title: 'Annual Income', isStatus: null),
              textFormField(
                hintText: 'Enter Your Annual Income',
                keyboardtype: TextInputType.number,
                inputFormatters: null,
                Controller: _AnnualIncome,
                validating: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter Your Annual Income";
                  }
                  else if (value == null) {
                    return "Please Enter Your Annual Income";
                  }
                  return null;
                },
                onChanged: null,
              ),
          
              //WORK LOCATION
              Title_Style(Title: 'Work Location', isStatus: null),
              textFormField(
                hintText: 'Enter Your Work Location',
                keyboardtype: TextInputType.text,
                inputFormatters: null,
                Controller: _WorkLocation,
                validating: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter Your Work Location";
                  }
                  else if (value == null) {
                    return "Please Enter Your Work Location";
                  }
                  return null;
                },
                onChanged: null,
              ),

              //BUTTON
              Padding(
                padding: const EdgeInsets.only(bottom: 50,top: 50),
                child: CommonElevatedButton(context, 'Next', () {
                  Registartion6ApiResponse();
                }),
              )
            ],
          ),
        ),
      ),
    );
  }

  Registartion6ApiResponse() async{
    final registration6ApiService = ApiService(ref.watch(dioProvider));
    var fromdata = FormData.fromMap({
      'user_id':await getuserId(),
      'education':_Education.text,
      'employeed_in':employeeVal,
      'company_name':_CompanyName.text,
      'occupation':_Occupation.text,
      'annual_income':_AnnualIncome.text,
      'work_location':_WorkLocation.text,
    });
    final Registration6Response = await ref.watch(registration6Provider(fromdata).future);
    LoadingOverlay.show(context);
    print("FORM DATA :: ${fromdata}");
    if(Registration6Response?.status == true){
      LoadingOverlay.hide();
      ShowToastMessage(Registration6Response?.message ?? "");
      print("PROFESSIONAL REGISTRATION SUCESS");
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Expectation_Registration_Screen()));

    }else{
      LoadingOverlay.hide();
      ShowToastMessage(Registration6Response?.message ?? "");
      print("PROFESSIONAL REGISTRATION ERROR");
    }
  }
}