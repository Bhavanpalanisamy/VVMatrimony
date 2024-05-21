import 'package:flutter/material.dart';
import 'package:vvmatrimony/Common_Widgets/Common_Button.dart';
import 'package:vvmatrimony/Common_Widgets/Custom_App_Bar.dart';
import 'package:vvmatrimony/Common_Widgets/Text_Form_Field.dart';
//import 'package:vvmatrimony/Src/Registration_Ui/Family_Registration_Screen/Professional_Registration_Screen.dart';
import 'package:vvmatrimony/Src/Registration_Ui/Family_Registration_Screen/Professional_Registration_Screen2.dart';
import 'package:vvmatrimony/utilits/Common_Colors.dart';
import 'package:vvmatrimony/utilits/Text_Style.dart';

class Horoscope_Registration_Screen extends StatefulWidget {
  const Horoscope_Registration_Screen({super.key});

  @override
  State<Horoscope_Registration_Screen> createState() => _Horoscope_Registration_ScreenState();
}

class _Horoscope_Registration_ScreenState extends State<Horoscope_Registration_Screen> {
  //ZODIAC
  String? zodiacVal;
  List<String> zodiacOption = [
    "Scorpio",
    "Cancer",
    "Leo",
  ];
  //STAR
  String? starVal;
  List<String> starOption = [
    "Anusam",
    "Kettai",
    "Poosam",
  ];
  //DOSHAM
  String? doshamVal;
  List<String> doshamOption = [
    "Yes",
    "No",
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
        Head_Text(HeadText: "Horoscope Information"),

        //ZODIAC
        Title_Style(Title: 'Zodiac', isStatus: null),
        dropDownField(
          context,
          hintText: 'Select Your Zodiac',
          value: zodiacVal,
          listValue: zodiacOption,
          onChanged: (String? newValue) {
            setState(() {
              zodiacVal = newValue;
            });
          },
        ),

        //STAR
        Title_Style(Title: 'Star', isStatus: null),
        dropDownField(
          context,
          hintText: 'Select Your Star',
          value: starVal,
          listValue: starOption,
          onChanged: (String? newValue) {
            setState(() {
              starVal = newValue;
            });
          },
        ),

        //DOSHAM
        Title_Style(Title: 'Having Dosham', isStatus: null),
        dropDownField(
          context,
          hintText: 'Select',
          value: doshamVal,
          listValue: doshamOption,
          onChanged: (String? newValue) {
            setState(() {
              doshamVal = newValue;
            });
          },
        ),

        const Spacer(),

        //BUTTON
        Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: CommonElevatedButton(context, 'Next', () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Professional_Registration_Screen2()));

          }),
        ),

      ],
    );
  }
}
