import 'dart:js';

import 'package:flutter/material.dart';
import 'package:vvmatrimony/utilits/Common_Colors.dart';

import '../../Common_Widgets/Common_List.dart';
import '../../Common_Widgets/Custom_App_Bar.dart';
import '../../utilits/Common_Colors.dart';
import '../../utilits/Text_Style.dart';
import '../Profile_Description_Ui/Profile_Description_Screen.dart';
class Myfavourites extends StatefulWidget {
  const Myfavourites ({super.key});

  @override
  State<Myfavourites > createState() => _MyfavouritesState();
}

class _MyfavouritesState extends State<Myfavourites > {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: Custom_AppBar_Logo(title: 'Notification', actions: [], isNav: true,),
    body: Column(
      children: [

        // PRROFILE
        _Profile_List(),
      ],
    )
    );
  }
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