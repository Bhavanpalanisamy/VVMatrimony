import 'package:flutter/material.dart';

import '../utilits/Common_Colors.dart';
import '../utilits/Text_Style.dart';

Widget Profile_List(context,{required String name,required String id,required String age,required String location,required String job}){
  return Padding(
    padding: const EdgeInsets.only(left: 15,right: 15,top: 5),
    child: Container(
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10,top: 5,bottom: 5,),
            child: Container(
              height: 160,
              width: 100,
              decoration: BoxDecoration(
                  border: Border.all(width: 3,color: grey1),
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('lib/assets/My_Fav_Image.png'))
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15 ,left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,style: FavT1,),
                Text(id,style: FavT2,),
                const SizedBox(height: 5,),
                Text(age,style: FavT3),
                Text(location,style: FavT3,),
                Text(job,style: FavT3,),
                Padding(
                  padding: const EdgeInsets.only(top: 10,bottom: 10),
                  child: Container(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10),
                          child: Image(image: AssetImage('lib/assets/My_Fav_icon.png')),
                        ),
                        Text('Remove Favorite',style: FavT4,),
                      ],
                    ),
                    height: 40,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: pink1,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
}