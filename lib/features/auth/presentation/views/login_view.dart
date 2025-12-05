import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media/core/global/widgets/button_widget.dart';
import 'package:social_media/core/global/widgets/textfield_widget.dart';
import 'package:social_media/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:social_media/features/auth/presentation/views/register_view.dart';
import 'package:social_media/features/auth/presentation/cubits/auth_states_cubit.dart';
import 'package:social_media/features/auth/presentation/views/widgets/auth_text_field.dart';
import 'package:social_media/features/home/presentation/views/home_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

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
    return BlocConsumer<AuthCubit, AuthStatesCubit>(
      listener: (context, state) {
        if (state is Authenticated) {
          print("LoginView: Authenticated state received");
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("Login Successful")));
          // Navigate to home and remove all previous routes
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const HomeView()),
            (route) => false,
          );
        } else if (state is AuthError) {
          print("LoginView: AuthError state received: ${state.message}");
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
                          child: TextfieldWidget(
                            data: "Hi There, Welcome Back Again",
                            fontsize: 28,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Column(
                          children: [
                            AuthTextField(
                              textEditingController: email,
                              hintText: "Enter you Email",
                              title: "Email",
                            ),
                            SizedBox(height: 16.h),
                            AuthTextField(
                              textEditingController: password,
                              hintText: "Enter you Password",
                              isobsecured: true,
                              title: "Password",
                            ),
                            SizedBox(height: 20),

                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.0.h),
                              child: ButtonWidget(
                                buttonName: "Login",
                                onPressed: loginHandler,
                              ),
                            ),
                            SizedBox(height: 16),
                          ],
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextfieldWidget(data: "Dont Have any account?"),
                            TextButton(
                              onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => RegisterView(),
                                ),
                              ),
                              child: TextfieldWidget(data: "Register"),
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
