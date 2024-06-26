import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vvmatrimony/Common_Widgets/Image_Path.dart';
import 'package:vvmatrimony/Src/Account_profile_Ui/Account_Profile_Screen.dart';
import 'package:vvmatrimony/Src/Notification_Ui/Notification_Screen.dart';
import '../utilits/Common_Colors.dart';
import '../utilits/Text_Style.dart';


class Custom_AppBar extends StatefulWidget implements PreferredSizeWidget {
  Custom_AppBar({Key? key,})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);
  @override
  final Size preferredSize; // default is 56.0
  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}
class _CustomAppBarState extends State<Custom_AppBar> {
  @override
  Widget build(BuildContext context) {
    return
      AppBar(
        primary: true,
        backgroundColor:backGroundColor,
        automaticallyImplyLeading: false,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
            systemNavigationBarColor: Colors.black, // Navigation bar
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark // Status bar
        ),

        leading: InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Accountprofile()));
          },
          child: Container(
            margin: EdgeInsets.only(left: 10,top: 5,bottom: 5),
            height: 15,
            width: 15,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
                  // borderRadius: BorderRadius.circular(15),
              image: DecorationImage(image: AssetImage('lib/assets/profileImg.png'),
                fit: BoxFit.cover
              ),
            ),
          ),
        ),
        centerTitle: true,
        actions:[
          Icon(Icons.search,color: pink1,),
          Padding(
            padding: const EdgeInsets.only(right: 20,left: 15),
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationScreen()));
              },
                child: Icon(Icons.notifications_none,color: pink1,)),
          ),
        ],
        title: ImgPathSvg('appBarLogo.svg'),

      );
  }
}

class Custom_AppBar_Logo extends StatefulWidget implements PreferredSizeWidget {
  String? title;
  bool? isNav;
  List<Widget>? actions;
  Custom_AppBar_Logo({Key? key, required this.title,required this.actions,required this.isNav})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);
  @override
  final Size preferredSize; // default is 56.0
  @override
  _Custom_AppBar_LogoState createState() => _Custom_AppBar_LogoState();
}
class _Custom_AppBar_LogoState extends State<Custom_AppBar_Logo> {
  @override
  Widget build(BuildContext context) {
    return
      AppBar(
        primary: true,
        backgroundColor:backGroundColor,
        automaticallyImplyLeading: false,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
            systemNavigationBarColor: Colors.black, // Navigation bar
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark // Status bar
        ),

        leading: widget.isNav==true?InkWell(
            onTap: ()=>Navigator.pop(context),
            child: Icon(Icons.arrow_back_ios,color: Black,)):null,
        centerTitle: true,
        actions:widget.actions,
        title: ImgPathSvg('appBarLogo.svg'),

      );
  }
}

