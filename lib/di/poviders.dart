import 'package:flutter/material.dart';
import 'package:insta_cl/models/db/database_manager.dart';
import 'package:insta_cl/models/repositories/user_repositories.dart';
import 'package:insta_cl/view_models/login_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';


List<SingleChildWidget> globalProviders = [
  ...independentModels,
  ...dependentModels,
  ...viewModels
];


List<SingleChildWidget> independentModels = [
  Provider<DatabaseManager>(
    create: (_) => DatabaseManager(),
  ),
];


List<SingleChildWidget> dependentModels = [
  ProxyProvider<DatabaseManager, UserRepository>(
    update: (_,dbManager,repo)=>UserRepository(dbManeger: dbManager),

  ),
];

List<SingleChildWidget> viewModels =[
  ChangeNotifierProvider<LoginViewModel>(
    create: (context) => LoginViewModel(
        userRepository: Provider.of<UserRepository>(context, listen: false)
    ),
  ),
];