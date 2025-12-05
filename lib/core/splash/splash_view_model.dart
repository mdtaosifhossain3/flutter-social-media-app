import 'dart:async';

import 'package:flutter/material.dart';
import 'package:social_media/core/onboard/onboard_view.dart';

class SplashViewModel {
  SplashViewModel._();

  static void redirectPage(context) async {
    await Future.delayed(
      Duration(seconds: 3),
      () => Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => OnboardView()),
        (Route route) => false,
      ),
    );
  }
}
