import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uit_hackathon/features/authentication/services/garbage_services.dart';
import 'package:uit_hackathon/main_app.dart';
import 'package:uit_hackathon/models/user.dart';
import 'package:uit_hackathon/providers/user_provider.dart';
import 'package:uit_hackathon/utils/error_handling.dart';
import 'package:http/http.dart' as http;
import 'package:uit_hackathon/utils/global_variables.dart';

class AuthServices {
  // sign up user
  Future<void> signUpUser({
    required BuildContext context,
    required String phoneNumber,
    required String password,
    required String name,
  }) async {
    try {
      User user = User(
        username: name,
        phoneNumber: phoneNumber,
        // avatar: '',
        id: '',
      );

      http.Response res = await http.post(
        Uri.parse('${uri}api/auth/register'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, 'Account create!');
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  // sign in user
  Future<void> signInUser({
    required BuildContext context,
    required String phoneNumber,
    required String password,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('${uri}api/auth/login'),
        body: jsonEncode({
          'phoneNumber': phoneNumber,
          'password': password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          print(res.headers);
          final preps = await SharedPreferences.getInstance();
          Provider.of<UserProvider>(context, listen: false).setUser(res.body);
          // get all garbage
          // await preps.setString(
          //   'x-auth-token',
          //   res.headers['access-token']!,
          // );
          print(jsonDecode(res.body)['id']);
          await preps.setString(
            'id',
            jsonDecode(res.body)['id'],
          );
          Navigator.pushNamed(context, MainApp.routeName);
        },
      );
    } catch (e) {
      print(e.toString());
      showSnackBar(context, e.toString());
    }
  }

  // get user data
  Future<void> getUserData({
    required BuildContext context,
  }) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();

      String? token = pref.getString('id');
      print(token);
      if (token == '') {
        pref.setString('id', '');
      } else {
        // get user data
        http.Response userRes = await http.get(
          Uri.parse('${uri}api/auth/getUserData/$token'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
        );

        Provider.of<UserProvider>(context, listen: false).setUser(userRes.body);
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
