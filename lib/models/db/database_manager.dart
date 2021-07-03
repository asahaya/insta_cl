import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:insta_cl/detamodel/user.dart';


class DatabaseManager{
  final FirebaseFirestore _db=FirebaseFirestore.instance;
//データベースに居なかったら登録をする
  Future<bool> searchUserInDb(auth.User firebaseUser) async{
    final query=await _db.collection("users")
        .where("UserId",isEqualTo: firebaseUser.uid)
        .get();
    if(query.docs.length>0){
      return true;
    }
    return false;
  }

  Future<void> insertUser(User user) async{
    await _db.collection("users").doc(user.userId).set(user.toMap());
  }

  Future<User> getUserInfoFromDbById(String userId)async {
    final query=await _db.collection("users").where("UserId",isEqualTo:userId).get();
    return User.fromMap(query.docs[0].data());
  }

}