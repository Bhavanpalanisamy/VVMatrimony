import 'package:flutter/material.dart';
import 'package:vvmatrimony/utilits/Common_Colors.dart';

import '../../Common_Widgets/Custom_App_Bar.dart';
import '../../utilits/Text_Style.dart';
class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: Custom_AppBar_Logo(title: 'Notification', actions: [], isNav: true,),
      body: SingleChildScrollView(
        child: Column(
          children: [

            //NOTIFICATION LISTS
            Container(
              height: MediaQuery.sizeOf(context).height,
              child: ListView.builder(
                itemCount: 6,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 15,top: 30,right: 15),
                    child: Container(
                      height: 100,width: 100,color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15,left: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            //NOTIFICATION IMAGE
                            Container(
                              height: 50,width: 50,
                              decoration:BoxDecoration(
                                  border: Border.all(width: 3,color: grey1),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                    image: AssetImage('lib/assets/Notification_icon.png')
                                ),
                                  borderRadius: BorderRadius.circular(5),color: Colors.white),),

                            const SizedBox(width: 10),

                            // TEXT INSIDE LIST
                            textinside(),
                          ],
                        ),
                      ),
                    ),
                  );
                },),
            ),
          ],
        ),
      ),
    );
  }
}

Widget textinside (){
  return Padding(
    padding: const EdgeInsets.only(left: 15),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("New Profile Added",style: notificationT1),
        const SizedBox(height: 5,),
        Text("Check Your Matches",style: notificationT2,),
        const SizedBox(height: 5,),
        Text("Mar 04,2024",style: notificationT3,)
      ],
    ),
  );
}
