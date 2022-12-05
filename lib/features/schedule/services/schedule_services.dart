import 'dart:convert';
import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:uit_hackathon/models/challenge.dart';
import 'package:http/http.dart' as http;
import 'package:uit_hackathon/models/schedule.dart';
import 'package:uit_hackathon/utils/error_handling.dart';
import 'package:uit_hackathon/utils/global_variables.dart';

class ScheduleServices {
  // sign up user
  Future<void> createChallenge({
    required BuildContext context,
    required Schedule schedule,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('${uri}api/order/create'),
        body: schedule.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      print(jsonDecode(res.body));
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, 'Success order');
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
