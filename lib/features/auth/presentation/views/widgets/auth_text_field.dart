import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController textEditingController;
  final bool isobsecured;
  const AuthTextField({
    super.key,
    required this.textEditingController,
    required this.hintText,
    this.isobsecured = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextField(
        controller: textEditingController,
        obscureText: isobsecured,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: theme.primary),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: theme.tertiary),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: theme.primary),
            borderRadius: BorderRadius.circular(12),
          ),

          filled: true,
          fillColor: theme.secondary,
        ),
      ),
    );
  }
}
