import 'package:flutter/material.dart';
import 'package:nid_flutter/auth/login/components/auth_login_form.dart';

class AuthLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('用户登录'),
      ),
      body: AuthLoginForm(),
    );
  }
}
