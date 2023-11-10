import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color? color;
  // final Color? color;
  const CustomButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.color = const Color.fromARGB(255, 27, 78, 165),
    // this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
        backgroundColor: color,
      ),
      child: Text(
        text,
        style: const TextStyle(
          color:  Colors.white,  //color == null ? Colors.white :
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}