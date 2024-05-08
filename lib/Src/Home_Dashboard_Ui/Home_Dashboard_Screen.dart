import 'package:flutter/material.dart';
import 'package:vvmatrimony/Src/Profile_Description_Ui/Profile_Description_Screen.dart';

import '../../Common_Widgets/Common_List.dart';
import '../../Common_Widgets/Custom_App_Bar.dart';
import '../../utilits/Common_Colors.dart';
class HomeDashboard extends StatefulWidget {
  const HomeDashboard({super.key});

  @override
  State<HomeDashboard> createState() => _HomeDashboardState();
}

class _HomeDashboardState extends State<HomeDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: Custom_AppBar(),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          child: _MainBody()

        ),
      ),
    );
  }
  //MAIN BODY
  Widget _MainBody(){
    return Column(
      children: [

        // BANNER IMAGE
        Banner(context),
        //PROFILE IMAGE
        Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: _Profile_List(),
        ),

      ],
    );
  }
}

//BANNER
Widget Banner (context){
  return Padding(
    padding: const EdgeInsets.only(left: 15,right: 15,top: 15,bottom: 15),
    child: Container(
      height: MediaQuery.sizeOf(context).height/8,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('lib/assets/Home_Dashboard_Image.png'))
      ),
    ),
  );
}

Widget _Profile_List(){
  return ListView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    scrollDirection: Axis.vertical,
    itemCount: 10,
    itemBuilder: (BuildContext context, int index) {
      return //PROFILE
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile_Description_Screen()));
            },
              child: Profile_List(context,name: 'Bhavan', id: '17421', age: '20', location: 'CBE', job: 'Software')),
        );
    },);
}