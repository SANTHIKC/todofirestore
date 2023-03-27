

import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FirestoreImage extends StatefulWidget {
  const FirestoreImage({Key? key}) : super(key: key);

  @override
  State<FirestoreImage> createState() => _FirestoreImageState();
}

class _FirestoreImageState extends State<FirestoreImage> {

  File?pickedImage;
  pickimage()async
  {
    ImagePicker imagePicker=ImagePicker();
    XFile? image =await imagePicker.pickImage(source: ImageSource.camera);
    if(image != null)
    {
      pickedImage =File(image.path);
    }
  }

  storageImage()async
  {
    var refdetails=await FirebaseStorage.instance.ref().child("image/k");
    refdetails.putFile(pickedImage!);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: ElevatedButton(onPressed: (){
            pickimage();
            storageImage();

          }, child: Text("upload image")))
        ],),
    );
  }
}
