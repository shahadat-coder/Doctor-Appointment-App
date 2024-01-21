import 'dart:convert';

import 'package:flutter/material.dart';

class AuthModel extends ChangeNotifier {
  bool _isLogin = false;
  Map<String, dynamic> user = {}; //update user details when login
  Map<String, dynamic> appointment =
  {}; //update upcoming appointment when login
  List<Map<String, dynamic>> favDoc = []; //get latest favorite doctor
  List<dynamic> _fav = []; //get all fav doctor id in list

  bool get isLogin {
    return _isLogin;
  }
}