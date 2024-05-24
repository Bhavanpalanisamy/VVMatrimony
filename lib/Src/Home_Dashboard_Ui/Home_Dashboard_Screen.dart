import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vvmatrimony/Model/HomeDashBoardModel.dart';
import 'package:vvmatrimony/Src/Profile_Description_Ui/Profile_Description_Screen.dart';
import 'package:vvmatrimony/utilits/ApiProvider.dart';
import 'package:vvmatrimony/utilits/Loading_Overlay.dart';

import '../../Common_Widgets/Common_List.dart';
import '../../Common_Widgets/Custom_App_Bar.dart';
import '../../utilits/Common_Colors.dart';
class HomeDashboard extends ConsumerStatefulWidget {
  const HomeDashboard({super.key});

  @override
  ConsumerState<HomeDashboard> createState() => _HomeDashboardState();
}

class _HomeDashboardState extends ConsumerState<HomeDashboard> {
  @override
  Widget build(BuildContext context) {
    final HomeDashBoardResponse = ref.watch(homeDashBoardProvider);
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: Custom_AppBar(),
      body: HomeDashBoardResponse.when(data: (HomeResponseData){
        return SingleChildScrollView(
          child: Container(
              width: MediaQuery.sizeOf(context).width,
              child: _MainBody(HomeResponseData)
          ),
        );
      },  error: (Object error, StackTrace stackTrace) {
        return Text(error.toString());
      },
        loading: () => Loader(context),
      )
    );
  }
  //MAIN BODY
  Widget _MainBody(HomeDashBoardModel? homeResponseData){
    return Column(
      children: [

        // BANNER IMAGE
        Banner(context),
        //PROFILE IMAGE
        Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: _Profile_List(homeResponseData),
        ),

      ],
    );
  }
}

//BANNER
Widget Banner (context){
  return Padding(
    padding: const EdgeInsets.only(left: 15,right: 15,top: 15,bottom: 15),
    child: Container(
      height: MediaQuery.sizeOf(context).height/8,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('lib/assets/Home_Dashboard_Image.png'))
      ),
    ),
  );
}

Widget _Profile_List(HomeDashBoardModel? homeResponseData){
  return ListView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    scrollDirection: Axis.vertical,
    itemCount: homeResponseData?.data?.length ?? 0,
    itemBuilder: (BuildContext context, int index) {
      return //PROFILE
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile_Description_Screen(uId: homeResponseData?.data?[index].vvmId ?? "",)));
            },
              child: Profile_List(context,
                  name: homeResponseData?.data?[index].name ?? "",
                  id: homeResponseData?.data?[index].vvmId ?? "",
                  age: homeResponseData?.data?[index].age ?? "",
                  location: homeResponseData?.data?[index].workLocation ?? "",
                  job: homeResponseData?.data?[index].occupation ?? "")),
        );
    },);
}