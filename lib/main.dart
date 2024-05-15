import 'package:flutter/material.dart';
import 'Src/GetStarted_Ui/GetStarted_Screen.dart';
import 'Src/Home_Dashboard_Ui/Home_Dashboard_Screen.dart';
import 'Src/Profile_Completed_Ui/Profile_Completed_Screen.dart';
import 'Src/Profile_Description_Ui/Profile_Description_Screen.dart';
import 'Src/Upload_Your_Photo_Ui/Upload_Your_Photo_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: GetStarted(),
    );
  }
}


