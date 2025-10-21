import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/features/auth/presentation/cubits/auth_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final authState = context.watch<AuthCubit>().currentUser;
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async {
              final auth = context.read<AuthCubit>();
              await auth.logout();
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: SafeArea(child: Container(child: Text(authState!.email))),
    );
  }
}
