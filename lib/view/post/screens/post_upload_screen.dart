import 'package:flutter/material.dart';
import 'package:insta_cl/view/utils/constants.dart';
import 'package:insta_cl/view_models/post_view_model.dart';
import 'package:provider/provider.dart';

class PostUploadScreen extends StatelessWidget {


  final UploadType uploadType;
  PostUploadScreen({required this.uploadType});

  @override
  Widget build(BuildContext context) {
    final postViewModel=context.read<PostViewModel>();//provider.dart import

    //画像を持ってきてない/処理中でない場合は
    if(!postViewModel.isImagePicked && !postViewModel.isProcessing){
      Future(()=>postViewModel.pickImage(uploadType));
    }

    return Scaffold();
  }
}
