import 'package:flutter/material.dart';

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
      appBar: Custom_AppBar_Logo(title: 'Notification', actions: [], isNav: true,),
      body: Column(
        children: [

          // BANNER IMAGE
          Banner(context),

          //PROFILE
          Profile_List(context,name: 'Bhavan', id: '17421', age: '20', location: 'CBE', job: 'Software'),
        ],
      ),
    );
  }
}

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
