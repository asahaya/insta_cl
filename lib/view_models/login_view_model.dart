import 'package:flutter/material.dart';
import 'package:insta_cl/models/repositories/user_repositories.dart';

class LoginViewModel extends ChangeNotifier{
  final UserRepository userRepository;
  LoginViewModel({required this.userRepository});

  bool isLoading=false;
  bool isSuccessful=false;

  Future<bool> isSignIn() async{
    return await userRepository.isSingIn();
  }

  Future<void> signIn()async {
    isLoading=true;
    notifyListeners();

    isSuccessful=await userRepository.signIn();

    isLoading=false;
    notifyListeners();
  }

}