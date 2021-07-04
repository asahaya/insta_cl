import 'dart:io';

import 'package:flutter/material.dart';
import 'package:insta_cl/models/repositories/post_repositories.dart';
import 'package:insta_cl/models/repositories/user_repositories.dart';
import 'package:insta_cl/view/utils/constants.dart';

class PostViewModel extends ChangeNotifier{
  final UserRepository userRepository;
  final PostRepository postRepository;

  PostViewModel({required this.userRepository,required this.postRepository});

  File? imageFile; //画像が取得できない可能性があるので「？」

  //処理中を示すプロパティ
  bool isProcessing=false;
  bool isImagePicked=false;

  Future<void> pickImage(UploadType uploadType) async{
    isImagePicked=false;
    isProcessing=false;
    notifyListeners();

    imageFile= await postRepository.pickImage(uploadType);
    print("pickedImage: ${imageFile?.path}");

    //TODO 位置情報取得
    if(imageFile != null) isImagePicked=true;
    isProcessing=false;
    notifyListeners();
  }
}