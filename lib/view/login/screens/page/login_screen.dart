import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:insta_cl/generated/l10n.dart';
import 'package:insta_cl/style.dart';
import 'package:insta_cl/view/common/component/button_with_icon.dart';
import 'package:insta_cl/view/home_screen.dart';
import 'package:insta_cl/view_models/login_view_model.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO
      body: Center(
        child: Consumer<LoginViewModel>(
          builder: (context, model, child) {
            return model.isLoading
                ? CircularProgressIndicator()
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        S.of(context).appTitle,
                        style: loginTitleTextStyle, //style.dartでの共通設定
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ButtonWithIcon(
                        iconData: FontAwesomeIcons.signInAlt,
                        //https://fontawesome.com/v5.15/icons?d=gallery&p=2&m=free
                        label: S.of(context).signIn,
                        onPressed: () => login(context),
                      )
                    ],
                  );
          },
        ),
      ),
    );
  }

  login(BuildContext context) async {
    final loginViewModel = Provider.of<LoginViewModel>(context, listen: false);
    await loginViewModel.signIn();
    //TODO サインインの結果
    if (!loginViewModel.isSuccessful) {
      //上手くいかない場合
      Fluttertoast.showToast(msg: S.of(context).signInFailed);
      return;
    }
    //上手くいった場合
    _openHomeScreen(context);
  }

  void _openHomeScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => HomeScreen(),
      ),
    );
  }
}
