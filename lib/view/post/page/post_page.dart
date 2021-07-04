
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:insta_cl/generated/l10n.dart';
import 'package:insta_cl/view/common/component/button_with_icon.dart';
import 'package:insta_cl/view/post/screens/post_upload_screen.dart';
import 'package:insta_cl/view/utils/constants.dart';

class PostPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ButtonWithIcon(
              iconData: FontAwesomeIcons.images,
              label: S.of(context).gallery,
              onPressed: () =>
                  _openPostUploadScreen(UploadType.GALLERY, context),
            ),
            SizedBox(
              height: 30,
            ),
            ButtonWithIcon(
              iconData: FontAwesomeIcons.camera,
              label: S.of(context).camera,
              onPressed: () =>
                  _openPostUploadScreen(UploadType.CAMERA, context),
            ),
          ],
        ),
      ),
    ));
  }

  _openPostUploadScreen(UploadType uploadType, BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => PostUploadScreen(uploadType: uploadType),
      ),
    );
  }
}
