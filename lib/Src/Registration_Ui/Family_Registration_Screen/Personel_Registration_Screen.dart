import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vvmatrimony/Common_Widgets/Common_Button.dart';
import 'package:vvmatrimony/Common_Widgets/Custom_App_Bar.dart';
import 'package:vvmatrimony/Common_Widgets/Text_Form_Field.dart';
import 'package:vvmatrimony/Src/Registration_Ui/Family_Registration_Screen/Horoscope_Registration_Screen.dart';
import 'package:vvmatrimony/utilits/ApiProvider.dart';
import 'package:vvmatrimony/utilits/ApiService.dart';
import 'package:vvmatrimony/utilits/Common_Colors.dart';
import 'package:vvmatrimony/utilits/Generic.dart';
import 'package:vvmatrimony/utilits/Loading_Overlay.dart';
import 'package:vvmatrimony/utilits/Text_Style.dart';

class Personel_Registration_Screen extends ConsumerStatefulWidget {
  const Personel_Registration_Screen({super.key});

  @override
  ConsumerState<Personel_Registration_Screen> createState() => _Personel_Registration_ScreenState();
}

class _Personel_Registration_ScreenState extends ConsumerState<Personel_Registration_Screen> {
  //MARTIAL STATUS
  String? martialVal;
  List<String> martialOption = [
    "UnMarried",
    "Divorced",
    "Widow"
  ];
  //ANY DISABILITY
  String? disabilityVal;
  List<String> disabilityOption = [
    "Yes",
    "No",
  ];
  //FAMILY
  String? familyTypeVal;
  List<String> familyTypeOption = [
    "Join Family",
    "Nuclear",
  ];

  TextEditingController _Height = TextEditingController();
  TextEditingController _Weight = TextEditingController();

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
          height: MediaQuery.sizeOf(context).height,
          child: Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: _MainBody(),

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

        //ANY DISABILITY
        Title_Style(Title: 'Any Disability', isStatus: null),
        dropDownField(
          context,
          hintText: 'Select',
          value: disabilityVal,
          listValue: disabilityOption,
          onChanged: (String? newValue) {
            setState(() {
              disabilityVal = newValue;
            });
          },
        ),

        //FAMILY TYPE
        Title_Style(Title: 'Family Type', isStatus: null),
        dropDownField(
          context,
          hintText: 'Select',
          value: familyTypeVal,
          listValue: familyTypeOption,
          onChanged: (String? newValue) {
            setState(() {
              familyTypeVal = newValue;
            });
          },
        ),
        const Spacer(),
        //BUTTON
        Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: CommonElevatedButton(context, 'Next', () {
            Registration4ApiResponse();
          }),
        ),
      ],
    );
  }
  //PERSONAL REGISTRATION
 Registration4ApiResponse() async{
    final registration4ApiService = ApiService(ref.watch(dioProvider));
    var formData = FormData.fromMap({
      "user_id":await getuserId(),
      "height":_Height.text,
      "weight":_Weight.text,
      "maritial_status":martialVal,
      "any_disability":disabilityVal,
      "family_type":familyTypeVal
    });
    print("MARTIAL STATUS :: ${martialVal}");
    print("DISABILITY :: ${disabilityVal}");
    print("FAMILY TYPE :: ${familyTypeVal}");

    final Registration4Response = await ref.watch(registration4Provider(formData).future);
    LoadingOverlay.show(context);
    if(Registration4Response?.status == true){
      LoadingOverlay.hide();
      print("PERSONAL INFORMATION REGISTER SUCESS");
      ShowToastMessage(Registration4Response?.message ?? "");
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Horoscope_Registration_Screen()));
    }else{
      LoadingOverlay.hide();
      print("PERSONAL INFORMATION REGISTER ERROR");
      ShowToastMessage(Registration4Response?.message ?? "");
    }
 }
}
