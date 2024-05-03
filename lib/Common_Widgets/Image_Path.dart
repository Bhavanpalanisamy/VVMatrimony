import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';


// PNG IMAGE PATH
Widget ImgPathPng(String pathPNG){
  return  Image(image: AssetImage("lib/assets/${pathPNG}"));
}


// SVG IMAGE PATH

Widget ImgPathSvg(String pathSVG){
  return  SvgPicture.asset("lib/assets/${pathSVG}");
}

// Logo Image
 Widget LoginScreenImage(){
  return ImgPathSvg("LoginscreenImg.svg");
 }
Widget Logo(){
  return ImgPathSvg("logo.svg");
}


