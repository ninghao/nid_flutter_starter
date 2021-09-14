import 'package:flutter/material.dart';
import 'package:nid_flutter/post/create/post_create.dart';
import 'package:nid_flutter/post/index/post_index.dart';
import 'package:nid_flutter/user/profile/user_profile.dart';

class AppPageMain extends StatelessWidget {
  final int currentIndex;

  AppPageMain({this.currentIndex = 0});

  // 一组页面主体小部件
  final pageMain = [
    // 发现
    PostIndex(),
    // 添加
    PostCreate(),
    // 用户
    UserProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return pageMain.elementAt(currentIndex);
  }
}
