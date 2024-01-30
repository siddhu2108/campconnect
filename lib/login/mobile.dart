import 'package:campus1/componants/mybutton.dart';
import 'package:campus1/componants/mytextfield.dart';
import 'package:flutter/material.dart';

import '../student/studentdashboard.dart';

class mobileLogin extends StatefulWidget {
  @override
  _MobileLoginState createState() => _MobileLoginState();
}

class _MobileLoginState extends State<mobileLogin> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.person, size: 80, color: Colors.white),
              const SizedBox(height: 30),
              Text(
                "CAMPUS  CONNECT",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
              Text(
                "_____________________",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
              const SizedBox(height: 30),
              mytextfield(
                hinttext: "Username",
                obsecure: false,
                controller: username,
                icon: Icons.person,
              ),
              const SizedBox(height: 15),
              mytextfield(
                hinttext: "Password",
                obsecure: true,
                controller: password,
                icon: Icons.lock,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      "Forgot Password ? ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              mybutton(
                text: "Sign In",
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> StudentDashboard1(studentDetails: {},)),);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
