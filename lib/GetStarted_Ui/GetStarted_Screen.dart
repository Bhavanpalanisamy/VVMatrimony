import 'package:flutter/material.dart';

import '../Common_Widgets/Custom_App_Bar.dart';
import '../utilits/Common_Colors.dart';
import '../utilits/Text_Style.dart';
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
      appBar: AppBar(
        title: Text("VV"),
        backgroundColor: backGroundColor,
      ),
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        child: Column(
          children: [

            // GROUP IMAGE

            Container(
              height: 370,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("lib/assets/groupimage.png"),
                    fit: BoxFit.cover),
              ),
            ),

            const SizedBox(height: 30,),

            Text('Discover Love where your \n            story begins.',style: Textfield_Style2,),
            const SizedBox(height: 30,),
            Text('Join us to discover your ideal partner \n '
                'and ignite the sparks of romance in\n                  '
                ' your journey..',style: Textfield_Style1,),

        const Spacer(),

            // BUTTON

            Padding(
              padding: const EdgeInsets.only(left: 25,right: 25),
              child: Container(
                height: 60,width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: pink1),

                // INSIDE BUTTON

                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: white1),
                        child: Icon(Icons.phone,color: pink1,size: 30,),
                      ),
                    ),
                    const SizedBox(width: 50,),

                    Text('Login with Phone',style: ButtonT,),
                  ],
                ),
              ),
            ),

            // ON CLICK TEXT

            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 60,right: 60,bottom: 30 ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don’t have an account?",style: onClicked_TextC,),
                  Text("Sign Up",style: onClicked_TextB,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
