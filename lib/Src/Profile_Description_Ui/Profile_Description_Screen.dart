import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vvmatrimony/Common_Widgets/Common_Button.dart';
import 'package:vvmatrimony/Common_Widgets/Custom_App_Bar.dart';
import 'package:vvmatrimony/Common_Widgets/Image_Path.dart';
import 'package:vvmatrimony/Model/UserDetailModel.dart';
import 'package:vvmatrimony/utilits/ApiProvider.dart';
import 'package:vvmatrimony/utilits/Common_Colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:vvmatrimony/utilits/Text_Style.dart';


class Profile_Description_Screen extends ConsumerStatefulWidget {
  final String uId;
   Profile_Description_Screen({super.key, required this.uId});

  @override
  ConsumerState<Profile_Description_Screen> createState() => _Profile_Description_ScreenState();
}

class _Profile_Description_ScreenState extends ConsumerState<Profile_Description_Screen> {
  int myCurrentPage = 0;
  @override
  Widget build(BuildContext context) {
    var formData = FormData.fromMap({
      "user_id":widget.uId,
    });
    final userDetailResponseData = ref.watch(userDetailProvider(formData));
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: Custom_AppBar_Logo(title: '', actions: null, isNav: true),
      body: userDetailResponseData.when(data: (userData){
        print("RESPOSNE :: ${userData?.data?.name ?? ""}");
        return SingleChildScrollView(
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //CAROSEL IMAGE
                _Carosel_ProfileImg(),
                //PROFILE
                Profile_Detail(context,userData),

              ],
            ),
          ),
        );
      }, error: (Object error, StackTrace stackTrace) {
        return Text(error.toString());
      },
        loading: () => null,
      )
    );
  }
  //CAROSEL IMAGE
  Widget _Carosel_ProfileImg(){
    return Stack(
      children: [
        CarouselSlider(
            items: [
              _carouselImg(context, profileImg: "profileImg.png"),
              _carouselImg(context, profileImg: "profileImg.png"),
              _carouselImg(context, profileImg: "profileImg.png"),
              _carouselImg(context, profileImg: "profileImg.png"),

            ],
            options: CarouselOptions(
              autoPlay: true,
              viewportFraction: 1,
              enlargeCenterPage: true,
              aspectRatio: 16/9,
              autoPlayAnimationDuration:Duration(milliseconds: 800),
              onPageChanged: (index,reason){
                setState(() {
                  myCurrentPage = index;
                });
              },
            )
        ),
        Positioned(
          bottom: 10,
          left: 100,right: 100,
          child: Center(
            child: AnimatedSmoothIndicator(
              activeIndex: myCurrentPage,
              count: 4,
              effect: ExpandingDotsEffect(
                  dotHeight: 5,
                  dotWidth: 5,
                  activeDotColor: pink1,
                dotColor: white1
              ),
            ),
          ),
        )
      ],
    );
  }
  
  //PROFILE TITLE
 Widget Profile_Detail(context, UserDetailModel? userData){
    return   Padding(
      padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _Profile_Name(context, profileName: userData?.data?.name ?? ""),
          Profile_Id(Content: 'Profile ID', text: 'CMM125486'),
          Profile_Id(Content: 'Age', text: '26'),

          //BIO
          Container(
            margin: EdgeInsets.only(top: 10,bottom: 10),
            width: MediaQuery.sizeOf(context).width/1.1,
              child: Text('My name is Priya. I am a Software Engineer. Working at CTS, Chennai.I am Graduated in B.E (CSE). I Grew up with Middle class lifestyle with Nuclear Familywith Tradintinoal values.',style: cardDetailT,maxLines: 4,)),

          Personal_Info(),

          Basic_Info(),

          Horoscope_Info(),

          Family_Info(),

          Proffessional_Info(),

          //BUTTON
          Padding(
            padding: const EdgeInsets.only(top: 30,bottom: 50),
            child: Call_Button(context, onPress: () {  }, ButtonText: 'Make a Call'),
          )


        ],
      ),
    );
 }
}

Widget _carouselImg(context,{required String profileImg}){
  return Container(
    height:MediaQuery.of(context).size.height/2,
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
      image: DecorationImage(image: AssetImage('lib/assets/${profileImg}',),
        fit: BoxFit.cover
      ),
    ),

  );
}

//PROFILE NAME
Widget _Profile_Name(context,{required String profileName}){
  return Row(
    children: [
    Container(
      width: MediaQuery.sizeOf(context).width/1.5,
        child: Text(profileName,style: ProfileT,)),
      const Spacer(),
      ImgPathSvg('heart.svg'),
    ],
  );
}
//PROFILE ID
Widget Profile_Id({required String Content,required String text}){
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('${Content}: ',style: profileId,),
      Text(text,style: MatrimonyID,),
    ],
  );
}

//PROFILE TEXT
Widget Profile_Text({required String ContentT,required String textT}){
  return Padding(
    padding: const EdgeInsets.only(bottom: 5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("${ContentT}: ",style: mapT2,),
        Container(
            child: Text(textT,style: profileId,maxLines: 2,)),
      ],
    ),
  );
}

//PERSONAL INFORMATION
Widget Personal_Info(){
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Personal Information',style: profileHeadingT,),
      const SizedBox(height: 5,),
      Profile_Text(ContentT: 'Name', textT: 'Priya Dharshini A'),
      Profile_Text(ContentT: 'Marital Status', textT: 'Unmarried'),
      Profile_Text(ContentT: 'Date of Birth', textT: '26.06.1998 (26 yr)'),
      Profile_Text(ContentT: 'Mother Tongue', textT: 'Tamil'),
      Profile_Text(ContentT: 'Religion', textT: 'Hindu'),
      Profile_Text(ContentT: 'Caste', textT: 'Kongu'),
    ],
  );
}

//BASIC INFO
Widget Basic_Info(){
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: 5,),
      Text('Basic Information',style: profileHeadingT,),
      const SizedBox(height: 5,),
      Profile_Text(ContentT: 'Weight', textT: 'Priya Dharshini A'),
      Profile_Text(ContentT: 'Height', textT: '155’22'),
      Profile_Text(ContentT: 'Any Disability', textT: 'No'),
    ],
  );
}

//HOROSCOPE INFO
Widget Horoscope_Info(){
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: 5,),
      Text('Horoscope Information',style: profileHeadingT,),
      const SizedBox(height: 5,),
      Profile_Text(ContentT: 'Zodiac', textT: 'Sagittarius'),
      Profile_Text(ContentT: 'Star', textT: 'Moolam'),
      Profile_Text(ContentT: 'Dhosam', textT: 'No'),
    ],
  );
}

//FAMILY INFO
Widget Family_Info(){
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Family Information',style: profileHeadingT,),
      const SizedBox(height: 5,),
      Profile_Text(ContentT: 'Father Name', textT: 'Ravi'),
      Profile_Text(ContentT: 'Father Occupation', textT: 'Business'),
      Profile_Text(ContentT: 'Mother Name', textT: 'Uma R'),
      Profile_Text(ContentT: 'Mother Occupation', textT: 'Home Maker'),
      Profile_Text(ContentT: 'Family Members', textT: '04'),
      Profile_Text(ContentT: 'Sister', textT: '01'),
      Profile_Text(ContentT: 'Native Location', textT: 'Salem'),
    ],
  );
}

//PROFFESSIONAL INFO
Widget Proffessional_Info(){
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: 5,),
      Text('Proffessional Information',style: profileHeadingT,),
      const SizedBox(height: 5,),
      Profile_Text(ContentT: 'Education', textT: 'B.E'),
      Profile_Text(ContentT: 'Employed', textT: 'Private'),
      Profile_Text(ContentT: 'Occupation', textT: 'Software Engineer'),
      Profile_Text(ContentT: 'Annual Income', textT: '3-4 Lakh'),
      Profile_Text(ContentT: 'Family Members', textT: '04'),
      Profile_Text(ContentT: 'Sister', textT: '01'),
      Profile_Text(ContentT: 'Work Location', textT: 'Chennai'),
    ],
  );
}

