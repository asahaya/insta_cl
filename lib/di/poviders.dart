import 'package:flutter/material.dart';
import 'package:insta_cl/models/db/database_manager.dart';
import 'package:insta_cl/models/repositories/post_repositories.dart';
import 'package:insta_cl/models/repositories/user_repositories.dart';
import 'package:insta_cl/view_models/login_view_model.dart';
import 'package:insta_cl/view_models/post_view_model.dart';
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
    update: (_, dbManager, repo) => UserRepository(dbManeger: dbManager),
  ),
  //POST
  ProxyProvider<DatabaseManager, PostRepository>(
    update: (_, dbManager, repo) => PostRepository(),
  ),
];

List<SingleChildWidget> viewModels = [
  ChangeNotifierProvider<LoginViewModel>(
    create: (context) => LoginViewModel(
      userRepository: context.read<UserRepository>(),
      // userRepository: Provider.of<UserRepository>(context, listen: false),
    ),
  ),
  //POST 受ける側
  ChangeNotifierProvider<PostViewModel>(
    create: (context) => PostViewModel(
      userRepository: context.read<UserRepository>(),
      postRepository: context.read<PostRepository>(),
      // userRepository: Provider.of<UserRepository>(context, listen: false),
      // postRepository: Provider.of<PostRepository>(context, listen: false),
    ),
  ),
];
