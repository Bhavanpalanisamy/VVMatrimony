import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vvmatrimony/Common_Widgets/Common_Button.dart';
import 'package:vvmatrimony/Common_Widgets/Custom_App_Bar.dart';
import 'package:vvmatrimony/Common_Widgets/Text_Form_Field.dart';
import 'package:vvmatrimony/Src/Profile_Completed_Ui/Profile_Completed_Screen.dart';
import 'package:vvmatrimony/Src/Registration_Ui/Family_Registration_Screen/Horoscope_Registration_Screen.dart';
import 'package:vvmatrimony/Src/Upload_Your_Photo_Ui/Upload_Your_Photo_Screen.dart';
import 'package:vvmatrimony/utilits/Common_Colors.dart';
import 'package:vvmatrimony/utilits/Text_Style.dart';

import '../../../utilits/ApiService.dart';
import '../../../utilits/Generic.dart';

class Expectation_Registration_Screen extends ConsumerStatefulWidget {
  const Expectation_Registration_Screen({super.key});

  @override
  ConsumerState<Expectation_Registration_Screen> createState() => _Expectation_Registration_ScreenState();
}

class _Expectation_Registration_ScreenState extends ConsumerState<Expectation_Registration_Screen> {
  //MARTIAL STATUS
  String? martialVal;
  List<String> martialOption = [
    "UnMarried",
    "Divorced",
    "Widow"
  ];


  TextEditingController _Height = TextEditingController();
  TextEditingController _Weight = TextEditingController();
  TextEditingController _Education = TextEditingController();
  TextEditingController _Occupation = TextEditingController();
  TextEditingController _Salary = TextEditingController();
  TextEditingController _Location = TextEditingController();



  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Custom_AppBar_Logo(title: '', actions: [], isNav: true,),
      backgroundColor: backGroundColor,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height*1.2,
            child: Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: _MainBody(),

            ),
          ),
        ),
      ),
    );
  }
  Widget _MainBody(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        //PERSONAL
        Head_Text(HeadText: "Tell about Some Personal"),

        //HEIGHT
        Title_Style(Title: 'Height', isStatus: null),
        textFormField(
          hintText: 'Enter Your Height',
          keyboardtype: TextInputType.number,
          inputFormatters: [
            LengthLimitingTextInputFormatter(3),
          ],
          Controller: _Height,
          validating: (value) {
            if (value == null || value.isEmpty) {
              return "Please Enter Your Height";
            }
            else if (value == null) {
              return "Please Enter Your Height";
            }
            return null;
          },
          onChanged: null,
        ),

        //WEIGHT
        Title_Style(Title: 'Weight', isStatus: null),
        textFormField(
          hintText: 'Enter Your Weight',
          keyboardtype: TextInputType.number,
          inputFormatters: [
            LengthLimitingTextInputFormatter(3),
          ],
          Controller: _Weight,
          validating: (value) {
            if (value == null || value.isEmpty) {
              return "Please Enter Your Weight";
            }
            else if (value == null) {
              return "Please Enter Your Weight";
            }
            return null;
          },
          onChanged: null,
        ),

        //MARTIAL STATUS
        Title_Style(Title: 'Marital Status', isStatus: null),
        dropDownField(
          context,
          hintText: 'Select Your Marital Status',
          value: martialVal,
          listValue: martialOption,
          onChanged: (String? newValue) {
            setState(() {
              martialVal = newValue;
            });
          },
        ),

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
        //OCCUPATION
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
        Title_Style(Title: 'Salary', isStatus: null),
        textFormField(
          hintText: 'Enter Your Salary',
          keyboardtype: TextInputType.number,
          inputFormatters: null,
          Controller: _Salary,
          validating: (value) {
            if (value == null || value.isEmpty) {
              return "Please Enter Your Salary";
            }
            else if (value == null) {
              return "Please Enter Your Salary";
            }
            return null;
          },
          onChanged: null,
        ),

        //LOCATION
        Title_Style(Title: 'Location', isStatus: null),
        textFormField(
          hintText: 'Enter Your Location',
          keyboardtype: TextInputType.number,
          inputFormatters: null,
          Controller: _Location,
          validating: (value) {
            if (value == null || value.isEmpty) {
              return "Please Enter Your Location";
            }
            else if (value == null) {
              return "Please Enter Your Location";
            }
            return null;
          },
          onChanged: null,
        ),

        //BUTTON
        Padding(
          padding: const EdgeInsets.only(top: 50),
          child: CommonElevatedButton(context, 'Next', () {
            Registartion7ApiResponse();
          }),
        ),
      ],
    );
  }
  Registartion7ApiResponse() async{
    final registration7ApiService = ApiService(ref.watch(dioProvider));
    var fromdate = FormData.fromMap({
      'user_id':await getuserId(),
      'exp_height': _Height,
      'exp_weight':_Weight,
      'exp_maritial_status':martialVal,
      'exp_education': _Education,
      'exp_occupation':_Occupation,
      'exp_salary':_Salary,
      'exp_location':_Location,
    });
    final Registration7Response = await registration7ApiService.registrationService7(context,fromdate);
    print("FORM DATA :: ${fromdate}");
    if(Registration7Response?.status == true){
      ShowToastMessage(Registration7Response?.message ?? "");
      print("EXPECTATION REGISTRATION SUCESS");
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Upload_Your_Photo_Screen()));

    }else{
      ShowToastMessage(Registration7Response?.message ?? "");
      print("EXPECTATION REGISTRATION ERROR");
    }
  }
}