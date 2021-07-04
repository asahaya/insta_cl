import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insta_cl/view/utils/constants.dart';

class PostRepository{

  //コンストラクタTODO
  Future<File?> pickImage(UploadType uploadType)async {
    final imagePicker =ImagePicker();

    if(uploadType==UploadType.GALLERY){
      final pickedImage=await imagePicker.getImage(source: ImageSource.gallery);
      return (pickedImage!=null)?File(pickedImage.path):null;
    }else{
      final pickedImage=await imagePicker.getImage(source: ImageSource.camera);
      return (pickedImage!=null)?File(pickedImage.path):null;
    }
  }
}