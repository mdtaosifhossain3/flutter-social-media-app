import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media/core/global/widgets/button_widget.dart';
import 'package:social_media/core/global/widgets/textfield_widget.dart';
import 'package:social_media/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:social_media/features/auth/presentation/views/login_view.dart';
import 'package:social_media/features/auth/presentation/cubits/auth_states_cubit.dart';
import 'package:social_media/features/auth/presentation/views/widgets/auth_text_field.dart';
import 'package:social_media/features/home/presentation/views/home_view.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

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

      return;
    }
    if (passwordText != confirmPasswordText) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Passwords do not match")));
      return;
    } else {
      final authCubit = context.read<AuthCubit>();
      authCubit.register(nameText, emailText, passwordText);
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
    return BlocConsumer<AuthCubit, AuthStatesCubit>(
      listener: (context, state) {
        if (state is Authenticated) {
          print("RegisterView: Authenticated state received");
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("Registration Successful")));
          // Navigate to home and remove all previous routes
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const HomeView()),
            (route) => false,
          );
        } else if (state is AuthError) {
          print("RegisterView: AuthError state received: ${state.message}");
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        if (state is AuthLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        return Scaffold(
          body: SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextfieldWidget(
                                data: "Register",
                                fontsize: 24.sp,
                                fontWeight: FontWeight.bold,
                              ),
                              SizedBox(height: 5.h),
                              TextfieldWidget(
                                data: "Lets create an account for you",
                                fontWeight: FontWeight.w300,
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            AuthTextField(
                              textEditingController: email,
                              hintText: "Enter you Email",
                              title: "Email",
                            ),
                            SizedBox(height: 12.h),
                            AuthTextField(
                              textEditingController: name,
                              hintText: "Enter you username",
                              title: "Username",
                            ),
                            SizedBox(height: 12.h),
                            AuthTextField(
                              textEditingController: password,
                              hintText: "Enter you Password",
                              isobsecured: true,
                              title: "Password",
                            ),
                            SizedBox(height: 12.h),
                            AuthTextField(
                              textEditingController: confirmPassword,
                              hintText: "Enter Confirm Password",
                              isobsecured: true,
                              title: "Confirm Password",
                            ),
                            SizedBox(height: 18.h),

                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.0.h),
                              child: ButtonWidget(
                                buttonName: "Register",
                                onPressed: registerhandler,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextfieldWidget(data: "Alredy Have an account?"),
                            TextButton(
                              onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_) => LoginView()),
                              ),
                              child: TextfieldWidget(
                                data: "Login",
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
