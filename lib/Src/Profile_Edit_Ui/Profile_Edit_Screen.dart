import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:vvmatrimony/utilits/Common_Colors.dart';

import '../../Common_Widgets/Common_Button.dart';
import '../../Common_Widgets/Custom_App_Bar.dart';
import '../../Common_Widgets/Text_Form_Field.dart';
import '../../utilits/Text_Style.dart';
import '../Registration_Ui/Family_Registration_Screen/Family_Registration_Screen.dart';
class Profileedit extends StatefulWidget {
  const Profileedit({super.key});

  @override
  State<Profileedit> createState() => _ProfileeditState();
}

class _ProfileeditState extends State<Profileedit> {

  final _formkey = GlobalKey<FormState>();

  // GENDER
  String? Gender;
  List<String> Genderoption = [
    "Male",
    "Female"
  ];

  //FAMILY MEMBERS
  String? familyVal;
  List<String> familyMemberOption = [
    "01",
    "02",
    "03",
    "04",
    "05",
    "06",
    "07",
    "08",
  ];
  //SISTERS MEMBER
  String? marriedSisterVal;
  List<String> marriedSisterMemberOption = [
    "01",
    "02",
    "03",
    "04",
    "05",
    "06",
    "07",
    "08",
  ];
  String? UnmarriedSisterVal;
  List<String> UnmarriedSisterMemberOption = [
    "01",
    "02",
    "03",
    "04",
    "05",
    "06",
    "07",
    "08",
  ];

  //BROTHER MEMBER
  String? marriedBrotherVal;
  List<String> marriedBrotherMemberOption = [
    "01",
    "02",
    "03",
    "04",
    "05",
    "06",
    "07",
    "08",
  ];
  String? UnmarriedBrotherVal;
  List<String> UnmarriedBrotherMemberOption = [
    "01",
    "02",
    "03",
    "04",
    "05",
    "06",
    "07",
    "08",
  ];

  //NATIVE LOCATION
  String? nativeVal;
  List<String> nativeOption = [
    "Coimbatore",
    "Madurai",
    "Chennai",
  ];
  //RELIGION
  String? religionVal;
  List<String> religionOption = [
    "Hindu",
    "Christian",
    "Muslim",
  ];
  //MOTHER TONGUE
  String? motherTongueVal;
  List<String> motherTongueOption = [
    "Tamil",
    "Telugu",
    "Kannada",
    "Saurashtra"
  ];
  //CASTE
  String? casteVal;
  List<String> casteOption = [
    "Vaniyar",
    "Gounder",
    "Jangam",
    "Reddy"
  ];
  //MARTIAL STATUS
  String? martialVal;
  List<String> martialOption = [
    "UnMarried",
    "Divorced",
    "Widow"
  ];
  //ANY DISABILITY
  String? disabilityVal;
  List<String> disabilityOption = [
    "Yes",
    "No",
  ];
  //FAMILY
  String? familyTypeVal;
  List<String> familyTypeOption = [
    "Join Family",
    "Nuclear",
  ];
  //ZODIAC
  String? zodiacVal;
  List<String> zodiacOption = [
    "Scorpio",
    "Cancer",
    "Leo",
  ];
  //STAR
  String? starVal;
  List<String> starOption = [
    "Anusam",
    "Kettai",
    "Poosam",
  ];
  //DOSHAM
  String? doshamVal;
  List<String> doshamOption = [
    "Naga Dosham",
    "Naga Dosham",
  ];
  //EMPLOYEE IN
  String? employeeVal;
  List<String> employeeOption = [
    "Government",
    "Private",
  ];

  TextEditingController _Education = TextEditingController();
  TextEditingController _CompanyName = TextEditingController();
  TextEditingController _Occupation = TextEditingController();
  TextEditingController _AnnualIncome = TextEditingController();
  TextEditingController _WorkLocation = TextEditingController();
  TextEditingController _Height = TextEditingController();
  TextEditingController _Weight = TextEditingController();
  TextEditingController _Name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _Age = TextEditingController();
  TextEditingController _Dob = TextEditingController();
  TextEditingController _FatherName = TextEditingController();
  TextEditingController _FatherOccupation = TextEditingController();
  TextEditingController _MotherName = TextEditingController();
  TextEditingController _MotherOccupation = TextEditingController();

  RegExp onlyText = RegExp(r'^[a-zA-Z ]+$');


  @override
  Widget build(BuildContext context) {
    void _showErrorDialog(String message) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Alert"),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () {
                  _Dob.text = "";
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    }
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: Custom_AppBar_Logo(title: '', actions: [], isNav: true,),
      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 15,right: 15,bottom: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // PROFILE PICKET
             Center(
               child: Padding(
                 padding: const EdgeInsets.only(top: 30),
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
               ),
             ),

                Informationtext(text: 'Personal Information'),

                // NAME
                Title_Style(Title: '"Full Name"', isStatus: null,),
                textFormField(hintText: 'Enter Your Name',
                  keyboardtype: TextInputType.text,
                  Controller: _Name,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(20),
                    FilteringTextInputFormatter.singleLineFormatter],
                  validating: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter Your Father Name";
                    }
                    else if (!onlyText.hasMatch(value)) {
                      return "Please Enter Your Father Name (Special Characters are Not Allowed)";
                    }
                    return null;
                  },
                  onChanged: null,
                ),
                //EMAIL
                Title_Style(Title: '"Email ID"', isStatus: null,),

                textFormField(hintText: 'Enter Your Email',
                  keyboardtype: TextInputType.text,

                  Controller: _email,
                  inputFormatters: [
                    FilteringTextInputFormatter.singleLineFormatter],
                  onChanged: null,
                  validating: (value){
                    if(value==null||value.isEmpty){
                      return "Enter Email";
                    }else if(!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)){
                      return "Please Enter valid Email ";
                    }else{
                      return null;
                    }
                  },
                ),

                //AGE

                Title_Style(Title: '"Your Age"', isStatus: null,),
                textFormField(hintText: 'Enter Your Age',
                    keyboardtype: TextInputType.number,
                    Controller: _Age,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(2),
                      FilteringTextInputFormatter.digitsOnly],
                    onChanged: null,
                    validating:(value){
                      if (value!.isEmpty) {
                        return 'Please Enter Age';
                      }
                    }
                ),

                //DOB
                Title_Style(Title: '"Date of Birth"', isStatus: null,),
                TextFieldDatePicker(
                  Controller: _Dob,
                  onChanged: null,
                  hintText: 'dd/MM/yyyy',
                  onTap: () async {
                    FocusScope.of(context).unfocus();
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1950),
                      lastDate: DateTime.now(),
                    );
                    if (pickedDate != null) {
                      String formattedDate =
                      DateFormat("dd/MM/yyyy").format(pickedDate);
                      if (mounted) {
                        setState(() {
                          _Dob.text = formattedDate;
                        });
                      }
                      DateTime currentDate = DateTime.now();
                      int age = currentDate.year - pickedDate.year;
                      if (age < 18) {
                        _showErrorDialog(
                            "You must be at least 18 years old to register.");
                      }
                    }
                  },
                  validating: (value) {
                    if (value!.isEmpty) {
                      return 'Please Select Date of Birth';
                    } else {
                      DateTime selectedDate =
                      DateFormat("dd/MM/yyyy").parse(value);
                      DateTime currentDate = DateTime.now();
                      int age = currentDate.year - selectedDate.year;
                      if (age < 18) {
                        return 'You must be at least 18 years old to register.';
                      } else {
                        return null;
                      }
                    }
                  },
                ),


                //GENDER
                Title_Style(Title: '"Gender"', isStatus: null,),
                dropDownField(
                  context,
                  hintText:"Select your Gender",
                  value: Gender,
                  listValue: Genderoption,
                  onChanged: (String? newvalue){
                    setState(() {
                      Gender = newvalue;
                    });
                  },
                ),

                //DECSRIPTION
                Title_Style(Title: '"About You"', isStatus: null,),
                textfieldDescription(hintText: 'Type...'),

                //Family Information
                Informationtext(text: 'Family Information'),
                _MainBody(),

                //Community Information
                Informationtext(text: 'Community Information'),

                //Personal Information
                _MainBody2(),
                Informationtext(text: 'Personal Information'),
                _MainBody3(),

                //Horoscope Information
                Informationtext(text: 'Horoscope Information'),
                _MainBody4(),

                //Professional Information
                Informationtext(text: 'Professional Information'),
                _Mainbody5(),

                // BUTTON
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: CommonElevatedButton(context, 'Save', () {
                    if(_formkey.currentState!.validate()){
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>Family_Registration_Screen()));
                    };
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget _Mainbody5 (){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        //EDUCTION
        Title_Style(Title: 'Education', isStatus: null),
        textFormField(
          hintText: 'Enter Your Education',
          keyboardtype: TextInputType.text,
          inputFormatters: null,
          Controller: _Education,
          validating: (value) {
            if (value == null || value.isEmpty) {
              return "Please Enter Your Education";
            }
            else if (value == null) {
              return "Please Enter Your Education";
            }
            return null;
          },
          onChanged: null,
        ),

        //EMPLOYEE IN
        Title_Style(Title: 'Employeed In', isStatus: null),
        dropDownField(
          context,
          hintText: 'Select',
          value: employeeVal,
          listValue: employeeOption,
          onChanged: (String? newValue) {
            setState(() {
              employeeVal = newValue;
            });
          },
        ),

        //COMPANY NAME
        Title_Style(Title: 'Company Name', isStatus: null),
        textFormField(
          hintText: 'Enter Your Company Name',
          keyboardtype: TextInputType.text,
          inputFormatters: null,
          Controller: _CompanyName,
          validating: (value) {
            if (value == null || value.isEmpty) {
              return "Please Enter Your Company Name";
            }
            else if (value == null) {
              return "Please Enter Your Company Name";
            }
            return null;
          },
          onChanged: null,
        ),

        //OCCUPATION
        Title_Style(Title: 'Occupation', isStatus: null),
        textFormField(
          hintText: 'Enter Your Occupation',
          keyboardtype: TextInputType.text,
          inputFormatters: null,
          Controller: _Occupation,
          validating: (value) {
            if (value == null || value.isEmpty) {
              return "Please Enter Your Occupation";
            }
            else if (value == null) {
              return "Please Enter Your Occupation";
            }
            return null;
          },
          onChanged: null,
        ),

        //ANNUAL INCOME
        Title_Style(Title: 'Annual Income', isStatus: null),
        textFormField(
          hintText: 'Enter Your Annual Income',
          keyboardtype: TextInputType.number,
          inputFormatters: null,
          Controller: _AnnualIncome,
          validating: (value) {
            if (value == null || value.isEmpty) {
              return "Please Enter Your Annual Income";
            }
            else if (value == null) {
              return "Please Enter Your Annual Income";
            }
            return null;
          },
          onChanged: null,
        ),

        //WORK LOCATION
        Title_Style(Title: 'Work Location', isStatus: null),
        textFormField(
          hintText: 'Enter Your Work Location',
          keyboardtype: TextInputType.number,
          inputFormatters: null,
          Controller: _WorkLocation,
          validating: (value) {
            if (value == null || value.isEmpty) {
              return "Please Enter Your Work Location";
            }
            else if (value == null) {
              return "Please Enter Your Work Location";
            }
            return null;
          },
          onChanged: null,
        ),
      ],
    );
  }
  Widget _MainBody4(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [

        //ZODIAC
        Title_Style(Title: 'Zodiac', isStatus: null),
        dropDownField(
          context,
          hintText: 'Select Your Zodiac',
          value: zodiacVal,
          listValue: zodiacOption,
          onChanged: (String? newValue) {
            setState(() {
              zodiacVal = newValue;
            });
          },
        ),

        //STAR
        Title_Style(Title: 'Star', isStatus: null),
        dropDownField(
          context,
          hintText: 'Select Your Star',
          value: starVal,
          listValue: starOption,
          onChanged: (String? newValue) {
            setState(() {
              starVal = newValue;
            });
          },
        ),

        //DOSHAM
        Title_Style(Title: 'Having Dosham', isStatus: null),
        dropDownField(
          context,
          hintText: 'Select',
          value: doshamVal,
          listValue: doshamOption,
          onChanged: (String? newValue) {
            setState(() {
              doshamVal = newValue;
            });
          },
        ),

      ],
    );
  }
  Widget _MainBody3(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [

        //HEIGHT
        Title_Style(Title: 'Height', isStatus: null),
        textFormField(
          hintText: 'Enter Your Height',
          keyboardtype: TextInputType.number,
          inputFormatters: [
            LengthLimitingTextInputFormatter(3),
          ],
          Controller: _Height,
          validating: (value) {
            if (value == null || value.isEmpty) {
              return "Please Enter Your Height";
            }
            else if (value == null) {
              return "Please Enter Your Height";
            }
            return null;
          },
          onChanged: null,
        ),

        //WEIGHT
        Title_Style(Title: 'Weight', isStatus: null),
        textFormField(
          hintText: 'Enter Your Weight',
          keyboardtype: TextInputType.number,
          inputFormatters: [
            LengthLimitingTextInputFormatter(3),
          ],
          Controller: _Weight,
          validating: (value) {
            if (value == null || value.isEmpty) {
              return "Please Enter Your Weight";
            }
            else if (value == null) {
              return "Please Enter Your Weight";
            }
            return null;
          },
          onChanged: null,
        ),

        //MARTIAL STATUS
        Title_Style(Title: 'Marital Status', isStatus: null),
        dropDownField(
          context,
          hintText: 'Select Your Marital Status',
          value: martialVal,
          listValue: martialOption,
          onChanged: (String? newValue) {
            setState(() {
              martialVal = newValue;
            });
          },
        ),

        //ANY DISABILITY
        Title_Style(Title: 'Any Disability', isStatus: null),
        dropDownField(
          context,
          hintText: 'Select',
          value: disabilityVal,
          listValue: disabilityOption,
          onChanged: (String? newValue) {
            setState(() {
              disabilityVal = newValue;
            });
          },
        ),

        //FAMILY TYPE
        Title_Style(Title: 'Family Type', isStatus: null),
        dropDownField(
          context,
          hintText: 'Select',
          value: familyTypeVal,
          listValue: familyTypeOption,
          onChanged: (String? newValue) {
            setState(() {
              familyTypeVal = newValue;
            });
          },
        ),
      ],
    );
  }
  Widget _MainBody2(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [

        //RELIGION
        Title_Style(Title: 'Religion', isStatus: null),
        dropDownField(
          context,
          hintText: 'Select Your Religion',
          value: religionVal,
          listValue: religionOption,
          onChanged: (String? newValue) {
            setState(() {
              religionVal = newValue;
            });
          },
        ),

        //MOTHER TONGUE
        Title_Style(Title: 'Mother Tongue', isStatus: null),
        dropDownField(
          context,
          hintText: 'Select Your Mother Tongue',
          value: motherTongueVal,
          listValue: motherTongueOption,
          onChanged: (String? newValue) {
            setState(() {
              motherTongueVal = newValue;
            });
          },
        ),

        //CASTE
        Title_Style(Title: 'Caste', isStatus: null),
        dropDownField(
          context,
          hintText: 'Select Your Caste',
          value: casteVal,
          listValue: casteOption,
          onChanged: (String? newValue) {
            setState(() {
              casteVal = newValue;
            });
          },
        ),

      ],
    );
  }

  Widget _MainBody(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [

        //FAMILY MEMBER
        Title_Style(Title: 'Family Members', isStatus: null),
        dropDownField(
          context,
          hintText: '00',
          value: familyVal,
          listValue: familyMemberOption,
          onChanged: (String? newValue) {
            setState(() {
              familyVal = newValue;
            });
          },
        ),

        //FATHER NAME
        Title_Style(Title: 'Father Name', isStatus: null),
        textFormField(
          hintText: 'Enter Your Father Name',
          keyboardtype: TextInputType.text,
          inputFormatters: null,
          Controller: _FatherName,
          validating: (value) {
            if (value == null || value.isEmpty) {
              return "Please Enter Your Father Name";
            }
            else if (!onlyText.hasMatch(value)) {
              return "Please Enter Your Father Name (Special Characters are Not Allowed)";
            }
            return null;
          },
          onChanged: null,
        ),

        //FATHER OCCUPATION
        Title_Style(Title: 'Father Occupation', isStatus: null),
        textFormField(
          hintText: 'Enter Your Father Occupation',
          keyboardtype: TextInputType.text,
          inputFormatters: null,
          Controller: _FatherOccupation,
          validating: (value) {
            if (value == null || value.isEmpty) {
              return "Please Enter Your Father Occupation";
            }
            else if (!onlyText.hasMatch(value)) {
              return "Please Enter Your Father Occupation (Special Characters are Not Allowed)";
            }
            return null;
          },
          onChanged: null,
        ),

        //MOTHER NAME
        Title_Style(Title: 'Mother Name', isStatus: null),
        textFormField(
          hintText: 'Enter Your Mother Name',
          keyboardtype: TextInputType.text,
          inputFormatters: null,
          Controller: _MotherName,
          validating: (value) {
            if (value == null || value.isEmpty) {
              return "Please Enter Your Mother";
            }
            else if (!onlyText.hasMatch(value)) {
              return "Please Enter Your Mother (Special Characters are Not Allowed)";
            }
            return null;
          },
          onChanged: null,
        ),

        //MOTHER OCCUPATION
        Title_Style(Title: 'Mother Occupation', isStatus: null),
        textFormField(
          hintText: 'Enter Your Mother Occupation',
          keyboardtype: TextInputType.text,
          inputFormatters: null,
          Controller: _MotherOccupation,
          validating: (value) {
            if (value == null || value.isEmpty) {
              return "Please Enter Your Mother Occupation";
            }
            else if (!onlyText.hasMatch(value)) {
              return "Please Enter Your Mother Occupation (Special Characters are Not Allowed)";
            }
            return null;
          },
          onChanged: null,
        ),

        //SIBLINGS
        Title_Style(Title: 'Siblings', isStatus: null),
        Sister_Siblings(),
        Brother_Siblings(),

        //NATIVE LOCATION
        Title_Style(Title: 'Native Location', isStatus: null),
        dropDownField(
          context,
          hintText: 'Select Location',
          value: nativeVal,
          listValue: nativeOption,
          onChanged: (String? newValue) {
            setState(() {
              nativeVal = newValue;
            });
          },
        ),

      ],
    );
  }
  //SISTER SIBLINGS
  Widget Sister_Siblings(){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text('Sisters(s)',style: SiblingsT,),
        //MARRIED
        Padding(
          padding: const EdgeInsets.only(left: 20,right: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Married',style: HintST,),
              Container(
                width: MediaQuery.sizeOf(context).width/4,
                child: dropDownField(
                  context,
                  hintText: '00',
                  value: marriedSisterVal,
                  listValue: marriedSisterMemberOption,
                  onChanged: (String? newValue) {
                    setState(() {
                      marriedSisterVal = newValue;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
        //UNMARRIED
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('UnMarried',style: HintST,),
            Container(
              width: MediaQuery.sizeOf(context).width/4,
              child: dropDownField(
                context,
                hintText: '00',
                value: UnmarriedSisterVal,
                listValue: UnmarriedSisterMemberOption,
                onChanged: (String? newValue) {
                  setState(() {
                    UnmarriedSisterVal = newValue;
                  });
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
  //BROTHER SIBLINGS
  Widget Brother_Siblings(){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text('Brother(s)',style: SiblingsT,),
        //MARRIED
        Padding(
          padding: const EdgeInsets.only(left: 20,right: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Married',style: HintST,),
              Container(
                width: MediaQuery.sizeOf(context).width/4,
                child: dropDownField(
                  context,
                  hintText: '00',
                  value: marriedBrotherVal,
                  listValue: marriedBrotherMemberOption,
                  onChanged: (String? newValue) {
                    setState(() {
                      marriedBrotherVal = newValue;
                    });
                  },
                ),
              ),
            ],
          ),
        ),

        //UNMARRIED
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('UnMarried',style: HintST,),
            Container(
              width: MediaQuery.sizeOf(context).width/4,
              child: dropDownField(
                context,
                hintText: '00',
                value: UnmarriedBrotherVal,
                listValue: UnmarriedBrotherMemberOption,
                onChanged: (String? newValue) {
                  setState(() {
                    UnmarriedBrotherVal = newValue;
                  });
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

}

Widget Informationtext({required String text}){
  return Padding(
    padding: const EdgeInsets.only(top: 20,left: 5),
    child: Text(text,style: profileHeadingT,),
  );
}



