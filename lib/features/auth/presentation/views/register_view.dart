import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:social_media/features/auth/presentation/views/widgets/auth_text_field.dart';
import 'package:social_media/features/auth/presentation/views/widgets/button_widget.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key, required this.onPressed});
  final void Function()? onPressed;

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final TextEditingController email = TextEditingController();

  final TextEditingController name = TextEditingController();

  final TextEditingController password = TextEditingController();

  final TextEditingController confirmPassword = TextEditingController();

  void registerhandler() {
    final String emailText = email.text.trim();
    final String nameText = name.text.trim();
    final String passwordText = password.text.trim();
    final String confirmPasswordText = confirmPassword.text.trim();

    if (emailText.isEmpty ||
        nameText.isEmpty ||
        passwordText.isEmpty ||
        confirmPasswordText.isEmpty) {
      // Show some error message
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Please fill in all fields")));
    }
    if (passwordText != confirmPasswordText) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Passwords do not match")));
    } else {
      final authCubit = context.read<AuthCubit>();
      authCubit.register(nameText, emailText, passwordText);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Registration Successful")));
    }
  }

  @override
  void dispose() {
    email.dispose();
    name.dispose();
    password.dispose();
    confirmPassword.dispose();
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
                "Lets create an account for you",
                style: TextStyle(color: theme.primary),
              ),
              SizedBox(height: 20),
              AuthTextField(
                textEditingController: email,
                hintText: "Enter you Email",
              ),
              SizedBox(height: 16),
              AuthTextField(
                textEditingController: name,
                hintText: "Enter you username",
              ),
              SizedBox(height: 16),
              AuthTextField(
                textEditingController: password,
                hintText: "Enter you Password",
                isobsecured: true,
              ),
              SizedBox(height: 16),
              AuthTextField(
                textEditingController: confirmPassword,
                hintText: "Enter Confirm Password",
                isobsecured: true,
              ),
              SizedBox(height: 20),

              ButtonWidget(buttonName: "Register", ontap: registerhandler),
              SizedBox(height: 16),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Alredy Have an account?",
                    style: TextStyle(color: theme.primary),
                  ),
                  TextButton(
                    onPressed: widget.onPressed,
                    child: Text("Login", style: TextStyle(color: Colors.black)),
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
