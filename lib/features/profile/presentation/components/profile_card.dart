import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String title;
  final String? value;

  const ProfileCard({super.key, required this.title, this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(12),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(value ?? "", style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}
