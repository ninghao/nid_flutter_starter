import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:nid_flutter/app/app_model.dart';
import 'package:nid_flutter/app/app_provider.dart';
import 'package:nid_flutter/app/router/app_route_information_parser.dart';
import 'package:nid_flutter/app/router/app_router_delegate.dart';
import 'package:nid_flutter/app/themes/app_theme.dart';
import 'package:nid_flutter/auth/auth.dart';
import 'package:nid_flutter/auth/auth_model.dart';
import 'package:nid_flutter/like/like_provider.dart';
import 'package:nid_flutter/post/post_provider.dart';
import 'package:nid_flutter/user/user_provider.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final AppModel appModel = AppModel();
  final AuthModel authModel = AuthModel();

  bool initializing = true;

  initialize() async {
    final prefs = await SharedPreferences.getInstance();
    final hasAuth = prefs.containsKey('auth');

    if (hasAuth) {
      final auth = Auth.fromJson(
        jsonDecode(prefs.getString('auth')!),
      );

      authModel.setAuth(auth);
    }

    setState(() {
      initializing = false;
    });
  }

  @override
  void initState() {
    super.initState();
    initialize();
  }

  @override
  Widget build(BuildContext context) {
    if (initializing) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        home: Scaffold(
          body: Center(
            child: Text('初始化...'),
          ),
        ),
      );
    }

    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: authModel),
        ChangeNotifierProvider.value(value: appModel),
        ...appPrividers,
        ...postProviders,
        ...likeProviders,
        ...userProviders,
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        routerDelegate: AppRouterDelegate(appModel),
        routeInformationParser: AppRouteInformationParser(),
      ),
    );
  }
}