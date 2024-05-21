import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vvmatrimony/Common_Widgets/Common_Button.dart';
import 'package:vvmatrimony/Common_Widgets/Custom_App_Bar.dart';
import 'package:vvmatrimony/Common_Widgets/Text_Form_Field.dart';
import 'package:vvmatrimony/Src/Registration_Ui/Family_Registration_Screen/Community_Registration_Screen.dart';
import 'package:vvmatrimony/utilits/ApiService.dart';
import 'package:vvmatrimony/utilits/Common_Colors.dart';
import 'package:vvmatrimony/utilits/Generic.dart';
import 'package:vvmatrimony/utilits/Text_Style.dart';


class Family_Registration_Screen extends ConsumerStatefulWidget {
  const Family_Registration_Screen({super.key});

  @override
  ConsumerState<Family_Registration_Screen> createState() => _Family_Registration_ScreenState();
}

class _Family_Registration_ScreenState extends ConsumerState<Family_Registration_Screen> {

  RegExp onlyText = RegExp(r'^[a-zA-Z ]+$');
  //FAMILY MEMBER
  String? familyVal;
  List<String> familyMemberOption = [
    "01",
    "02",
    "03",
    "04",
    "05",
    "06",
    "07",
    "08",
  ];
  //SISTERS MEMBER
  String? marriedSisterVal;
  List<String> marriedSisterMemberOption = [
    "01",
    "02",
    "03",
    "04",
    "05",
    "06",
    "07",
    "08",
  ];
  String? UnmarriedSisterVal;
  List<String> UnmarriedSisterMemberOption = [
    "01",
    "02",
    "03",
    "04",
    "05",
    "06",
    "07",
    "08",
  ];

  //BROTHER MEMBER
  String? marriedBrotherVal;
  List<String> marriedBrotherMemberOption = [
    "01",
    "02",
    "03",
    "04",
    "05",
    "06",
    "07",
    "08",
  ];
  String? UnmarriedBrotherVal;
  List<String> UnmarriedBrotherMemberOption = [
    "01",
    "02",
    "03",
    "04",
    "05",
    "06",
    "07",
    "08",
  ];

  //NATIVE LOCATION
  String? nativeVal;
  List<String> nativeOption = [
    "Coimbatore",
    "Madurai",
    "Chennai",
  ];

  TextEditingController _FatherName = TextEditingController();
  TextEditingController _FatherOccupation = TextEditingController();
  TextEditingController _MotherName = TextEditingController();
  TextEditingController _MotherOccupation = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: Custom_AppBar_Logo(title: '', actions: [], isNav: true,),
      backgroundColor: backGroundColor,
      body: Form(
        key: _formKey,
        child: Container(
            width: MediaQuery.sizeOf(context).width,
          child: Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: SingleChildScrollView(
              child:
              _MainBody(),
            ),
          ),
        ),
      ),
    );
  }

  //MAIN BODY
  Widget _MainBody(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        //ABOUT FAMILY
        Head_Text(HeadText: "Tell about Your Family"),

        //FAMILY MEMBER
        Title_Style(Title: 'Family Members', isStatus: null),
        dropDownField(
          context,
          hintText: '00',
          value: familyVal,
          listValue: familyMemberOption,
          onChanged: (String? newValue) {
            setState(() {
              familyVal = newValue;
            });
          },
        ),

        //FATHER NAME
        Title_Style(Title: 'Father Name', isStatus: null),
        textFormField(
          hintText: 'Enter Your Father Name',
          keyboardtype: TextInputType.text,
          inputFormatters: null,
          Controller: _FatherName,
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

        //FATHER OCCUPATION
        Title_Style(Title: 'Father Occupation', isStatus: null),
        textFormField(
          hintText: 'Enter Your Father Occupation',
          keyboardtype: TextInputType.text,
          inputFormatters: null,
          Controller: _FatherOccupation,
          validating: (value) {
            if (value == null || value.isEmpty) {
              return "Please Enter Your Father Occupation";
            }
            else if (!onlyText.hasMatch(value)) {
              return "Please Enter Your Father Occupation (Special Characters are Not Allowed)";
            }
            return null;
          },
          onChanged: null,
        ),

        //MOTHER NAME
        Title_Style(Title: 'Mother Name', isStatus: null),
        textFormField(
          hintText: 'Enter Your Mother Name',
          keyboardtype: TextInputType.text,
          inputFormatters: null,
          Controller: _MotherName,
          validating: (value) {
            if (value == null || value.isEmpty) {
              return "Please Enter Your Mother";
            }
            else if (!onlyText.hasMatch(value)) {
              return "Please Enter Your Mother (Special Characters are Not Allowed)";
            }
            return null;
          },
          onChanged: null,
        ),

        //MOTHER OCCUPATION
        Title_Style(Title: 'Mother Occupation', isStatus: null),
        textFormField(
          hintText: 'Enter Your Mother Occupation',
          keyboardtype: TextInputType.text,
          inputFormatters: null,
          Controller: _MotherOccupation,
          validating: (value) {
            if (value == null || value.isEmpty) {
              return "Please Enter Your Mother Occupation";
            }
            else if (!onlyText.hasMatch(value)) {
              return "Please Enter Your Mother Occupation (Special Characters are Not Allowed)";
            }
            return null;
          },
          onChanged: null,
        ),

        //SIBLINGS
        Title_Style(Title: 'Siblings', isStatus: null),
        Sister_Siblings(),
        Brother_Siblings(),

        //NATIVE LOCATION
        Title_Style(Title: 'Native Location', isStatus: null),
        dropDownField(
          context,
          hintText: 'Select Location',
          value: nativeVal,
          listValue: nativeOption,
          onChanged: (String? newValue) {
            setState(() {
              nativeVal = newValue;
            });
          },
        ),

        //BUTTON
        Padding(
          padding: const EdgeInsets.only(top: 30,bottom: 50),
          child: CommonElevatedButton(context, 'Next', () {
            if(_formKey.currentState!.validate()){
              Registartion2ApiResponse();
            }
          }),
        )
      ],
    );
  }
  //SISTER SIBLINGS
 Widget Sister_Siblings(){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
      Text('Sisters(s)',style: SiblingsT,),
        //MARRIED
        Padding(
          padding: const EdgeInsets.only(left: 20,right: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Married',style: HintST,),
              Container(
                width: MediaQuery.sizeOf(context).width/4,
                child: dropDownField(
                  context,
                  hintText: '00',
                  value: marriedSisterVal,
                  listValue: marriedSisterMemberOption,
                  onChanged: (String? newValue) {
                    setState(() {
                      marriedSisterVal = newValue;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
        //UNMARRIED
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('UnMarried',style: HintST,),
            Container(
              width: MediaQuery.sizeOf(context).width/4,
              child: dropDownField(
                context,
                hintText: '00',
                value: UnmarriedSisterVal,
                listValue: UnmarriedSisterMemberOption,
                onChanged: (String? newValue) {
                  setState(() {
                    UnmarriedSisterVal = newValue;
                  });
                },
              ),
            ),
          ],
        ),
      ],
    );
 }
 //BROTHER SIBLINGS
 Widget Brother_Siblings(){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
      Text('Brother(s)',style: SiblingsT,),
        //MARRIED
        Padding(
          padding: const EdgeInsets.only(left: 20,right: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Married',style: HintST,),
              Container(
                width: MediaQuery.sizeOf(context).width/4,
                child: dropDownField(
                  context,
                  hintText: '00',
                  value: marriedBrotherVal,
                  listValue: marriedBrotherMemberOption,
                  onChanged: (String? newValue) {
                    setState(() {
                      marriedBrotherVal = newValue;
                    });
                  },
                ),
              ),
            ],
          ),
        ),

        //UNMARRIED
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('UnMarried',style: HintST,),
            Container(
              width: MediaQuery.sizeOf(context).width/4,
              child: dropDownField(
                context,
                hintText: '00',
                value: UnmarriedBrotherVal,
                listValue: UnmarriedBrotherMemberOption,
                onChanged: (String? newValue) {
                  setState(() {
                    UnmarriedBrotherVal = newValue;
                  });
                },
              ),
            ),
          ],
        ),
      ],
    );
 }

 //FAMILY REGISTRATION
Registartion2ApiResponse() async{
 final registration2ApiService = ApiService(ref.watch(dioProvider));

 var formData = FormData.fromMap({
   "user_id": await getuserId(),
   "family_members": familyVal,
   "father_name":_FatherName.text,
   "father_occupation":_FatherOccupation.text,
   "mother_name":_MotherName.text,
   "mother_occupation":_MotherOccupation.text,
   "native_location":nativeVal,
   "married_sisters":marriedSisterVal,
   "unmarried_sisters":UnmarriedSisterVal,
   "married_brother":marriedBrotherVal,
   "unmarried_brother":UnmarriedBrotherVal,
 });

 final Registration2Response = await registration2ApiService.registrationService2(context,formData);
 print("FORM DATA :: ${formData}");
 if(Registration2Response?.status == true){
     ShowToastMessage(Registration2Response?.message ?? "");
   print("FAMILY REGISTRATION SUCESS");
   Navigator.push(context, MaterialPageRoute(builder: (context)=>Community_Registration_Screen()));

 }else{
   ShowToastMessage(Registration2Response?.message ?? "");
   print("FAMILY REGISTRATION ERROR");
 }
}
}


