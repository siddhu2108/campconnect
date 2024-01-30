import 'package:flutter/material.dart';

class mytextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hinttext;
  final IconData icon;
  final bool obsecure;

  const mytextfield({
    required this.controller,
    required this.hinttext,
    required this.icon,
    required this.obsecure,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.black), // Set border color
        ),
        hintText: hinttext,
        hintStyle: TextStyle(color: Colors.black), // Set hint text color
        prefixIcon: Icon(icon,
            color: Colors.blue[800]), // Set prefix icon color to blue
        // Set input text color
        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.black),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
      style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.normal), // Set input text color
      obscureText: obsecure,
    );
  }
}
