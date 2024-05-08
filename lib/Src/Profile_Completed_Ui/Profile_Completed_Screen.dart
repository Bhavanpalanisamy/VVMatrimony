import 'package:flutter/material.dart';
import 'package:vvmatrimony/Common_Widgets/Common_Button.dart';
import 'package:vvmatrimony/Common_Widgets/Image_Path.dart';
import 'package:vvmatrimony/utilits/Common_Colors.dart';
import 'package:vvmatrimony/utilits/Text_Style.dart';

class Profile_Completed_Screen extends StatefulWidget {
  const Profile_Completed_Screen({super.key});

  @override
  State<Profile_Completed_Screen> createState() => _Profile_Completed_ScreenState();
}

class _Profile_Completed_ScreenState extends State<Profile_Completed_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: _MainBody(),

      ),
    );
  }
  Widget _MainBody(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 100,),
        Center(child: ImgPathPng('completed.png')),
        //PROFILE COMPLETED
        Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Text("Profile Completed",style: Textfield_Style2,),
        ),
        Text("Find Your Best Matches",style: mapT1,),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: CommonElevatedButton(context, 'Go to Home', () { }),
        )
      ],
    );
  }
}
