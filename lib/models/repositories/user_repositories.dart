import 'dart:io';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:insta_cl/detamodel/user.dart';
import 'package:insta_cl/models/db/database_manager.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class UserRepository {
  final DatabaseManager dbManeger;

  UserRepository({required this.dbManeger});

  static User? currentUser;

  final auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;

  //koutei[6]
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<bool> isSingIn() async {
    final firebaseUser = _auth.currentUser;
    if (firebaseUser != null) {
      currentUser=await dbManeger.getUserInfoFromDbById(firebaseUser.uid);
      //アカウント情報が居たら
      return true;
    }
    return false;
  }

  Future<bool> signIn() async {
    try {
      GoogleSignInAccount? signInAccount = await _googleSignIn.signIn();
      if (signInAccount == null) return false;
      GoogleSignInAuthentication signInAuthentication =
          await signInAccount.authentication;

      final auth.AuthCredential credential = auth.GoogleAuthProvider.credential(
          idToken: signInAuthentication.idToken,
          accessToken: signInAuthentication.accessToken);

      final firebaseUser = (await _auth.signInWithCredential(credential)).user;
      if (firebaseUser == null) {
        return false;
      }

      //TODO DBに登録
      final isUserExisedInDb = await dbManeger.searchUserInDb(firebaseUser);
      if (!isUserExisedInDb) {
        //isUuserExisedInDb==false
        await dbManeger.insertUser(_convertToUser(firebaseUser));
      }

      //アプリ全体で使えるように
      currentUser = await dbManeger.getUserInfoFromDbById(firebaseUser.uid);
      return true;
    } catch (error) {
      print("sign in error caught:${error.toString()}");
      return false;
    }
  }

  _convertToUser(auth.User firebaseUser) {
    return User(
      userId: firebaseUser.uid,
      displayName: firebaseUser.displayName ?? "",
      inAppUserName: firebaseUser.displayName ?? "",
      photoUrl: firebaseUser.photoURL ?? "",
      email: firebaseUser.email ?? "",
      bio: "",
    );
  }
}
