import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  Function() onTap;
  CustomButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onTap();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,

        minimumSize: Size(double.infinity, 60),
      ),
      child: Text(
        "Update product",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
