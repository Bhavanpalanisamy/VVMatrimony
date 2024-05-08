import 'dart:js';

import 'package:flutter/material.dart';
import 'package:vvmatrimony/utilits/Common_Colors.dart';

import '../../Common_Widgets/Common_List.dart';
import '../../Common_Widgets/Custom_App_Bar.dart';
import '../../utilits/Common_Colors.dart';
import '../../utilits/Text_Style.dart';
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
        Profile_List(context,name: 'Bhavan', id: '6182686', age: '20', location: 'CBE', job: 'Software Eng'),
      ],
    )
    );
  }
}
