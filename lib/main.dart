import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:insta_cl/di/poviders.dart';
import 'package:insta_cl/style.dart';
import 'package:insta_cl/view/home_screen.dart';
import 'package:insta_cl/view/login/screens/page/login_screen.dart';
import 'package:insta_cl/view_models/login_view_model.dart';
import 'package:provider/provider.dart';

import 'generated/l10n.dart';

void main()async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(
    MultiProvider(providers: globalProviders,
    child: MyApp(),)
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginViewModel = Provider.of<LoginViewModel>(context, listen: false);

    return MaterialApp(
      title: "insta",
      //TODO　INTL初期化コード
      debugShowCheckedModeBanner: false,
      //デバッグ時右上のリボンを消す
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      //

      theme: ThemeData(
        brightness: Brightness.dark, //ダークモード
        elevatedButtonTheme: ElevatedButtonThemeData(
          //共通ボタンテーマ
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
            onPrimary: Colors.black,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.red,
        ),
        fontFamily: RegularFont, //共通フォント
      ),
      home: FutureBuilder(
          future: loginViewModel.isSignIn(),
          builder: (context, AsyncSnapshot<bool> snapshot) {
            if (snapshot.hasData && snapshot.data == true) {
              return HomeScreen();
            } else {
              return LoginScreen();
            }
          }),
    );
  }
}
