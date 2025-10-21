import 'package:flutter/material.dart';
import 'package:social_media/features/auth/presentation/views/login_view.dart';
import 'package:social_media/features/auth/presentation/views/register_view.dart';

class AuthView extends StatefulWidget {
  const AuthView({super.key});

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  bool isLoginPage = true;

  void togglePage() {
    setState(() {
      isLoginPage = !isLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoginPage
        ? LoginView(onPressed: togglePage)
        : RegisterView(onPressed: togglePage);
  }
}
