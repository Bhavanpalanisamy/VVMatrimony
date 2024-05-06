import 'package:flutter/material.dart';

import '../Common_Widgets/Text_Form_Field.dart';
import '../utilits/Common_Colors.dart';
import '../utilits/Text_Style.dart';
class Yourdetails extends StatefulWidget {
  const Yourdetails({super.key});

  @override
  State<Yourdetails> createState() => _YourdetailsState();
}

class _YourdetailsState extends State<Yourdetails> {
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        backgroundColor: backGroundColor,
        title: Text('VV'),
      ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        Center(child: Text("Tell about Yourself",style: Textfield_Style2,)),
            
            // TEXTFROM FIELD HEADING (Name)
            
            Text("Full Name",style: Textfield_Style1,),
            Form(
                key: _formkey,
                child: textFormField2(hintText: 'Enter Your Name', keyboardtype: TextInputType.text,)),

            // TEXTFORM FIELD EMAIL
            Text("Email ID",style: Textfield_Style1,),

    ])
    );
  }
}
