import 'package:flutter/material.dart';
import 'package:vvmatrimony/Common_Widgets/Common_Button.dart';
import 'package:vvmatrimony/Common_Widgets/Image_Path.dart';
import 'package:vvmatrimony/Common_Widgets/Image_Picker.dart';
import 'package:vvmatrimony/Src/LoginPage_Ui/LoginPage_Screen.dart';
import 'package:vvmatrimony/Src/YourDetails_Ui/YourDetails_Screen.dart';
import 'package:vvmatrimony/utilits/Common_Colors.dart';
import 'package:vvmatrimony/utilits/Text_Style.dart';


class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: _MainBody(),

        ),
      ),
    );
  }
  Widget _MainBody(){
    return  Column(
      children: [
        Small_Logo(),
        // GROUP IMAGE
        Container(
            height: MediaQuery.sizeOf(context).height / 2.5,
            width: MediaQuery.sizeOf(context).width,
            child: ImgPathSvg('appInfo.svg')),

        //DISCOVERY
        _DisCoverT(context),

        //JOIN US
        _JoinUsT(context),
        const Spacer(),

        // BUTTON
        Call_Button(context, onPress: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => LoginPage()));
        }, ButtonText: 'Login with Phone'),

        // ON CLICK TEXT
        Sign_Up(onPress: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Yourdetails()));
        }),
      ],
    );
  }
}

//DISCOVER TEXT
Widget _DisCoverT(context) {
  return Container(
      width: MediaQuery.sizeOf(context).width / 1.2,
      child: Text(
        'Discover Love where your story begins.',
        style: Textfield_Style2,
        textAlign: TextAlign.center,
        maxLines: 2,
      ));
}

Widget _JoinUsT(context) {
  return Container(
    margin: EdgeInsets.only(top: 20),
    width: MediaQuery.sizeOf(context).width / 1.2,
    child: Text(
      'Join us to discover your ideal partner and ignite the sparks of romance in your journey..',
      style: sub_ContentST,
      maxLines: 3,
      textAlign: TextAlign.center,
    ),
  );
}
