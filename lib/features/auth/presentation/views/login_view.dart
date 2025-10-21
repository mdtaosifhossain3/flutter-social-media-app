import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:social_media/features/auth/presentation/views/widgets/auth_text_field.dart';
import 'package:social_media/features/auth/presentation/views/widgets/button_widget.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key, required this.onPressed});
  final void Function()? onPressed;

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController email = TextEditingController();

  final TextEditingController password = TextEditingController();

  void loginHandler() {
    final em = email.text;
    final pw = password.text;

    final authCubit = context.read<AuthCubit>();

    if (em.isNotEmpty && pw.isNotEmpty) {
      authCubit.login(em, pw);
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Fields Cant be Empty")));
    }
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.lock_open_outlined, size: 150, color: theme.primary),
              Text(
                "Hi There, Welcome Back Again",
                style: TextStyle(color: theme.primary),
              ),
              SizedBox(height: 20),
              AuthTextField(
                textEditingController: email,
                hintText: "Enter you Email",
              ),
              SizedBox(height: 16),
              AuthTextField(
                textEditingController: password,
                hintText: "Enter you Password",
                isobsecured: true,
              ),
              SizedBox(height: 20),

              ButtonWidget(buttonName: "Login", ontap: loginHandler),
              SizedBox(height: 16),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Dont Have any account?",
                    style: TextStyle(color: theme.primary),
                  ),
                  TextButton(
                    onPressed: widget.onPressed,
                    child: Text(
                      "Register",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
