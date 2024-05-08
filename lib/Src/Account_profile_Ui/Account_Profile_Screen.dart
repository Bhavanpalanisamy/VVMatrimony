
import 'package:flutter/material.dart';
import 'package:vvmatrimony/utilits/Common_Colors.dart';
import '../../Common_Widgets/Custom_App_Bar.dart';
import '../../Common_Widgets/Image_Path.dart';
import '../../utilits/Text_Style.dart';
class Accountprofile extends StatefulWidget {
  const Accountprofile({super.key});

  @override
  State<Accountprofile> createState() => _AccountprofileState();
}

class _AccountprofileState extends State<Accountprofile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: Custom_AppBar_Logo(title: '', actions: [], isNav: true,),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          child: Column(
            children: [
              // PROFILE CONTAINER
              Profilecontainer(),

              // PROFILE NAME
              profilename(),

              // MATRIMONY ID
              matrimony(),

              //CONTAINERS
              Containers(context, text: 'My Profile', image: ('Profile_Frame.svg'), onTap: null),
              Containers(context, text: 'My Favorites', image: ('Heart_Frame.svg'), onTap: null),
              Containers(context, text: 'Terms & Condition', image: ('Terms_Condition_Frame.svg'), onTap: null),
              Containers(context, text: 'Privacy Policy', image: ('Lock_Image.svg'), onTap: null),
              Containers(context, text: 'About', image: ('About_Frame.svg'), onTap: null),
              Containers(context, text: 'Logout', image: ('Logout_Frame.svg'), onTap: null),
          ],
          ),
        ),
      ),
    );
  }
}

Widget profilename (){
  return Padding(
    padding: const EdgeInsets.only(top: 10,bottom: 10),
    child: Text("Dharshan A",style: ProfileT,),
  );
}

Widget matrimony (){
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: Text("Matrimony ID: CMM125486",style: MatrimonyID,),
  );
}

Widget Containers(context ,{required String text,required String image,required void Function()? onTap}){
  return Padding(
    padding: const EdgeInsets.only(left: 15,right: 15,top: 10,bottom: 10),
    child: InkWell(
      onTap: onTap,
      child: Container(
          height: 60,
          width: MediaQuery.sizeOf(context).height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.white,),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15,right: 15),
                child: ImgPathSvg(image),
              ),
              Text(text,style: ContainerT,)
            ],
          )
      ),
    ),
  );
}

Widget Profilecontainer (){
  return Padding(
    padding: const EdgeInsets.only(top: 20),
    child: Container(
      height: 170,width: 170,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),color: Colors.white,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("lib/assets/profile_logo.png"),
        ),
      ),
    ),
  );
}