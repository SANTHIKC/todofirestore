

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
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
      setState(() {
        storageImage();
      });
    }
  }

  storageImage()async
  {
    var refdetails=await FirebaseStorage.instance.ref().child("image/${pickedImage!.path}");
    await refdetails.putFile(pickedImage!);
    var url=await refdetails.getDownloadURL();
    FirebaseFirestore.instance.collection("images").add({"images":url});
    print(url);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: ElevatedButton(onPressed: (){
            pickimage();

          }, child: Text("upload image")))
        ],),
    );
  }
}
