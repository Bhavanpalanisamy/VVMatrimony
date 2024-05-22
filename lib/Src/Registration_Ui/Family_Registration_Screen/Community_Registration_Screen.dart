import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vvmatrimony/Common_Widgets/Common_Button.dart';
import 'package:vvmatrimony/Common_Widgets/Custom_App_Bar.dart';
import 'package:vvmatrimony/Common_Widgets/Text_Form_Field.dart';
import 'package:vvmatrimony/Src/Registration_Ui/Family_Registration_Screen/Personel_Registration_Screen.dart';
import 'package:vvmatrimony/utilits/ApiProvider.dart';
import 'package:vvmatrimony/utilits/ApiService.dart';
import 'package:vvmatrimony/utilits/Common_Colors.dart';
import 'package:vvmatrimony/utilits/Loading_Overlay.dart';
import 'package:vvmatrimony/utilits/Text_Style.dart';

import '../../../utilits/Generic.dart';

class Community_Registration_Screen extends ConsumerStatefulWidget {
  const Community_Registration_Screen({super.key});

  @override
  ConsumerState<Community_Registration_Screen> createState() => _Community_Registration_ScreenState();
}

class _Community_Registration_ScreenState extends ConsumerState<Community_Registration_Screen> {
  //RELIGION
  String? religionVal;
  List<String> religionOption = [
    "Hindu",
    "Christian",
    "Muslim",
  ];
  //MOTHER TONGUE
  String? motherTongueVal;
  List<String> motherTongueOption = [
    "Tamil",
    "Telugu",
    "Kannada",
    "Saurashtra"
  ];
  //CASTE
  String? casteVal;
  List<String> casteOption = [
    "Vaniyar",
    "Gounder",
    "Jangam",
    "Reddy"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Custom_AppBar_Logo(title: '', actions: [], isNav: true,),
      backgroundColor: backGroundColor,
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: Padding(
          padding: const EdgeInsets.only(left: 20,right: 20),
          child:_MainBody(),
        ),
      ),
    );
  }
  Widget _MainBody(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        //COMMUNITY
        Head_Text(HeadText: "Tell about Your Community"),

        //RELIGION
        Title_Style(Title: 'Religion', isStatus: null),
        dropDownField(
          context,
          hintText: 'Select Your Religion',
          value: religionVal,
          listValue: religionOption,
          onChanged: (String? newValue) {
            setState(() {
              religionVal = newValue;
            });
          },
        ),

        //MOTHER TONGUE
        Title_Style(Title: 'Mother Tongue', isStatus: null),
        dropDownField(
          context,
          hintText: 'Select Your Mother Tongue',
          value: motherTongueVal,
          listValue: motherTongueOption,
          onChanged: (String? newValue) {
            setState(() {
              motherTongueVal = newValue;
            });
          },
        ),

        //CASTE
        Title_Style(Title: 'Caste', isStatus: null),
        dropDownField(
          context,
          hintText: 'Select Your Caste',
          value: casteVal,
          listValue: casteOption,
          onChanged: (String? newValue) {
            setState(() {
              casteVal = newValue;
            });
          },
        ),

        const Spacer(),

        //BUTTON
        Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: CommonElevatedButton(context, 'Next', () {
            Registartion3ApiResponse();
          }),
        ),

      ],
    );
  }

  Registartion3ApiResponse() async{
    final registration3ApiService = ApiService(ref.watch(dioProvider));
    LoadingOverlay.show(context);
    var formDate = FormData.fromMap({
      'user_id':await getuserId(),
      'religion':religionVal,
      'mother_tongue':motherTongueVal,
      'caste':casteVal,
    });
    final Registration3Response = await ref.watch(registration3Provider(formDate).future);
    print("FORM DATA :: ${formDate}");
    if(Registration3Response?.status == true){
      LoadingOverlay.hide();
      ShowToastMessage(Registration3Response?.message ?? "");
      print("COMMUNITY REGISTRATION SUCESS");
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Personel_Registration_Screen()));

    }else{
      LoadingOverlay.hide();
      ShowToastMessage(Registration3Response?.message ?? "");
      print("COMMUNITY REGISTRATION ERROR");
    }
  }
}