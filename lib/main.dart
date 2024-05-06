import 'package:flutter/material.dart';
import 'package:vvmatrimony/GetStarted_Ui/GetStarted_Screen.dart';
import 'package:vvmatrimony/LoginPage_Ui/LoginPage_Screen.dart';
import 'package:vvmatrimony/MyNumber_Ui/MyNumber_Screen.dart';
import 'package:vvmatrimony/OTP_Ui/OTP_Screen.dart';
import 'package:vvmatrimony/YourDetails_Ui/YourDetails_Screen.dart';

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
      home: Yourdetails(),
    );
  }
}


