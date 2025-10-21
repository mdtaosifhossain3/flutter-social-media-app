import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final void Function()? ontap;
  final String buttonName;
  const ButtonWidget({super.key, this.ontap, required this.buttonName});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.tertiary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: ontap,
        child: Center(
          child: Text(
            buttonName,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
