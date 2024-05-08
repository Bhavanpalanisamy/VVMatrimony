import 'package:flutter/material.dart';
import 'package:vvmatrimony/Common_Widgets/Custom_App_Bar.dart';
import 'package:vvmatrimony/utilits/Common_Colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class Profile_Description_Screen extends StatefulWidget {
  const Profile_Description_Screen({super.key});

  @override
  State<Profile_Description_Screen> createState() => _Profile_Description_ScreenState();
}

class _Profile_Description_ScreenState extends State<Profile_Description_Screen> {
  int myCurrentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: Custom_AppBar_Logo(title: '', actions: null, isNav: true),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
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
              AnimatedSmoothIndicator(
                activeIndex: myCurrentPage,
                count: 4,
                effect: ExpandingDotsEffect(
                    dotHeight: 5,
                    dotWidth: 5,
                    activeDotColor: pink1
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget _carouselImg(context,{required String profileImg}){
  return Container(
    height: 200,
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
      image: DecorationImage(image: AssetImage('lib/assets/${profileImg}'),
      ),
    ),

  );
}
