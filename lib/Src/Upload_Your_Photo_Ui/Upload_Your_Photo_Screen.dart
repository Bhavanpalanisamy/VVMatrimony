import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vvmatrimony/Common_Widgets/Common_Button.dart';
import 'package:vvmatrimony/Common_Widgets/Custom_App_Bar.dart';
import 'package:vvmatrimony/Common_Widgets/Image_Path.dart';
import 'package:vvmatrimony/utilits/Common_Colors.dart';
import 'package:vvmatrimony/utilits/Text_Style.dart';

class Upload_Your_Photo_Screen extends StatefulWidget {
  const Upload_Your_Photo_Screen({super.key});

  @override
  State<Upload_Your_Photo_Screen> createState() => _Upload_Your_Photo_ScreenState();
}

class _Upload_Your_Photo_ScreenState extends State<Upload_Your_Photo_Screen> {
  final ImagePicker _imagePicker = ImagePicker();
  List<XFile> _selectedImages = [];
  void _pickImage(ImageSource source) async {
    if (_selectedImages.length < 5) {
      final XFile? pickedImage = await _imagePicker.pickImage(
        source: source,
      );
      if (pickedImage != null) {
        setState(() {
          _selectedImages.add(pickedImage);
        });
      }
    } else {
      // Handle maximum image selection limit reached
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Image Limit Exceeded'),
            content: Text('You can only select up to 5 images.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
  void _showImagePickerBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.camera),
                title: Text('Take Photo'),
                onTap: () {
                  setState(() {
                    Navigator.pop(context);
                    _pickImage(ImageSource.camera);
                  });
                },
              ),
              ListTile(
                leading: Icon(Icons.photo),
                title: Text('Choose from Gallery'),
                onTap: () {
                  setState(() {
                    Navigator.pop(context);

                    _pickImage(ImageSource.gallery);
                  });
                },
              ),
            ],
          ),
        );
      },
    );
  }

//Remove IMAGE
  void _removeImage(int index) {
    setState(() {
      _selectedImages.removeAt(index);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: Custom_AppBar_Logo(title: '', actions: null, isNav: true),
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: Padding(
          padding: const EdgeInsets.only(left: 20,right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //PHOTO
              Head_Text(HeadText: "Upload your photo"),
              _Sub_Text(context),

              //ADD IMAGE
              _Add_Image(),

              Container(
                  width: MediaQuery.of(context).size.width/1.3,
                  margin: EdgeInsets.only(top: 15,bottom: 25),
                  alignment: Alignment.topRight,
                  child: Text('Upload upto 5 Image each of up 5MB of .jpeg, .jpg, .png',
                    style: ButtonT1,)),
              const Spacer(),
              //BUTTON
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: CommonElevatedButton(context, 'Continue', () { }),
              ),
            ],
          ),
        ),
      ),
    );
  }
  // ADD IMAGE
  Widget _Add_Image(){
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: white1
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _selectedImages.isEmpty?
          Container(
              width:MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(top: 20),
              child: ImgPathSvg('addimage.svg')):
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              height: 250,
              color: white1,
              child: Center(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: _selectedImages.length,
                  itemBuilder: (BuildContext context, int index) {
                    return  Padding(
                      padding: const EdgeInsets.only(left: 10,right: 10),
                      child: Stack(
                        children: [
                          Container(
                            height: 250,
                            width: 250,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Image.file(File(_selectedImages[index].path),fit: BoxFit.cover,height: 250,width: 250,),
                          ),
                          Positioned(
                              top: 0,
                              right: 0,
                              child: InkWell(
                                  onTap:()=> _removeImage(index),
                                  child: Icon(Icons.cancel,color: red1,)))
                        ],
                      ),
                    );
                  },),
              ),
            ),
          ),
          //ADD IMAGE BUTTON
          InkWell(
            onTap: _showImagePickerBottomSheet,
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: pink1
                ),
                margin: EdgeInsets.only(top: 10,bottom: 20),
                child: Padding(
                  padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10,right: 10),
                  child: Text('Add Image',style: priceT,),
                )),
          ),

        ],
      ),
    );
  }
}


Widget _Sub_Text(context){
  return Container(
    margin: EdgeInsets.only(top: 10,bottom: 20),
    width: MediaQuery.sizeOf(context).width,
      child: Text('We love to see you. Upload a photo for your dating journey.',style: onClicked_TextC,maxLines: 2,textAlign: TextAlign.center,));
}