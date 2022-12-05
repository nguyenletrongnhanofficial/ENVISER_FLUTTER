import 'package:flutter/material.dart';
import 'package:uit_hackathon/features/challenge/services/challenge_services.dart';
import 'package:uit_hackathon/models/challenge.dart';

class ChallengeProvider extends ChangeNotifier {
  List<Challenge> _challenges = [];
  final ChallengeServices challengeServices = ChallengeServices();

  List<Challenge> get challenge => _challenges;

  void setChallenges(List<Challenge> challenges) {
    _challenges = challenges;
    notifyListeners();
  }

  void addChallenge(Challenge challenge) {
    _challenges.add(challenge);
    notifyListeners();
  }
}
