import 'dart:convert';
import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uit_hackathon/models/challenge.dart';
import 'package:http/http.dart' as http;
import 'package:uit_hackathon/providers/challenge_provider.dart';
import 'package:uit_hackathon/providers/user_provider.dart';
import 'package:uit_hackathon/utils/error_handling.dart';
import 'package:uit_hackathon/utils/global_variables.dart';

class ChallengeServices {
  Future<void> createChallenge({
    required BuildContext context,
    required Challenge challenge,
    required List<File> images,
  }) async {
    try {
      final cloudinary = CloudinaryPublic('dpx4x5tfh', 'm1gthj2u');

      for (int i = 0; i < images.length; i++) {
        CloudinaryResponse response = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(
            images[i].path,
            folder: 'challenges',
          ),
        );
        challenge.images.add(response.secureUrl);
      }

      http.Response res = await http.post(
        Uri.parse('${uri}api/challenge/create'),
        body: challenge.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      print(jsonDecode(res.body));
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          final challengeProvider = context.read<ChallengeProvider>();
          challengeProvider.addChallenge(challenge);
          //showSnackBar(context, 'Success Challenge');
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<void> getChallenges({
    required BuildContext context,
  }) async {
    try {
      final userProvider = context.read<UserProvider>();

      http.Response res = await http.post(
        Uri.parse('${uri}api/challenge/getAll'),
        body: jsonEncode({
          'user_id': userProvider.user.id,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      print(jsonDecode(res.body));
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          final challengeProvider = context.read<ChallengeProvider>();
          //challengeProvider.addChallenge(challenge);
          //showSnackBar(context, 'Success Challenge');
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
