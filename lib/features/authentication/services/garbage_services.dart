import 'dart:convert';
import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uit_hackathon/models/garbage.dart';
import 'package:uit_hackathon/providers/garbage_provider.dart';
import 'package:uit_hackathon/providers/user_provider.dart';
import 'package:uit_hackathon/utils/error_handling.dart';
import 'package:http/http.dart' as http;
import 'package:uit_hackathon/utils/global_variables.dart';

class GarbageServices {
  Future<void> getAllGarbage({
    required BuildContext context,
  }) async {
    try {
      http.Response res = await http.get(
        Uri.parse('${uri}api/garbage/getAllGarbage'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      print("haizza");
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          List<Garbage> garbages = [];
          var result = jsonDecode(res.body);
          print(result);

          for (int i = 0; i < result.length; i++) {
            Garbage garbage = Garbage.fromJson(
              jsonEncode(
                result[i],
              ),
            );
            print(garbage.url);
            garbages.add(garbage);
          }

          Provider.of<GarbageProvider>(context, listen: false)
              .setGarbage(garbages);
          print("ok roi haha");
        },
      );
    } catch (e) {
      showSnackBar(context, "loi ne: " + e.toString());
    }
  }

  Future<void> addGarbage({
    required BuildContext context,
    required Garbage garbage,
    required File file,
  }) async {
    try {
      final cloudinary = CloudinaryPublic('dpx4x5tfh', 'm1gthj2u');

      CloudinaryResponse response = await cloudinary.uploadFile(
        CloudinaryFile.fromFile(
          file.path,
          folder: 'challenges',
        ),
      );
      garbage = garbage.copyWith(url: response.secureUrl);

      http.Response res = await http.post(
        Uri.parse('${uri}api/garbage/createGarbage'),
        body: garbage.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          var response = json.decode(res.body);
          print("data ne");
          print(response.runtimeType);
          Map<String, dynamic> data = response['data'];
          Garbage garbage = Garbage.fromMap(data);
          print(garbage.runtimeType);
          print(garbage.id);
          Provider.of<GarbageProvider>(context, listen: false)
              .addGarbage(garbage);
          Navigator.of(context).pop();
        },
      );
    } catch (e) {
      print(e.toString());
      showSnackBar(context, e.toString());
    }
  }

  // get user data
  void getUserData({
    required BuildContext context,
  }) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();

      String? token = pref.getString('x-auth-token');

      if (token == null) {
        pref.setString('x-auth-token', '');
      }

      http.Response tokenRes = await http.post(
        Uri.parse('$uri/isTokenValid'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token!,
        },
      );

      var response = jsonDecode(tokenRes.body);

      if (response == true) {
        // get user data
        http.Response userRes = await http.get(
          Uri.parse('$uri/'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': token,
          },
        );
        Provider.of<UserProvider>(context, listen: false).setUser(userRes.body);
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
