import 'package:campus1/admin/admin_dashboard.dart';
import 'package:campus1/componants/mybutton.dart';
import 'package:campus1/componants/mytextfield.dart';
import 'package:flutter/material.dart';

import '../cons/app_colors.dart';
import '../student/bottom/student_section/LeaveApplicationScreen.dart';
import '../student/studentdashboard.dart';

class DesktopLoginPage extends StatelessWidget {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  DesktopLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppColor.tertiary,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: LayoutBuilder(
            builder: (context, constraints) {
              // Check the screen width and return the appropriate UI
              if (constraints.maxWidth > 600) {
                // Desktop UI
                return buildDesktopUI(context);
              } else {
                // Mobile or smaller screen UI
                return buildMobileUI(context);
              }
            },
          ),
        ),
      ),
    );
  }

  Widget buildDesktopUI(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(Icons.admin_panel_settings, size: 80, color: Colors.white),
        SizedBox(height: 30),
        Text(
          "CAMPUS  CONNECT",
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
        Text(
          "_____________________",
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
        SizedBox(height: 30),
        MyTextField(
          hinttext: "Username",
          obsecure: false,
          controller: username,
          icon: Icons.person,
        ),
        SizedBox(height: 15),
        MyTextField(
          hinttext: "Password",
          obsecure: true,
          controller: password,
          icon: Icons.lock,
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {
                // Handle Forgot Password
              },
              child: Text(
                "Forgot Password ? ",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 25),
        MyButton(
          text: "Sign In ",
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => DashboardScreen()),
            );
          },
        ),
      ],
    );
  }

  Widget buildMobileUI(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(Icons.person, size: 80, color: Colors.white),
        SizedBox(height: 30),
        Text(
          "CAMPUS  CONNECT",
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
        Text(
          "_____________________",
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
        SizedBox(height: 30),
        MyTextField(
          hinttext: "Username",
          obsecure: false,
          controller: username,
          icon: Icons.person,
        ),
        SizedBox(height: 15),
        MyTextField(
          hinttext: "Password",
          obsecure: true,
          controller: password,
          icon: Icons.lock,
        ),
        SizedBox(height: 10),
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
        SizedBox(height: 25),
        MyButton(
          text: "Sign In",
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => StudentDashboard1(studentDetails: {})),
            );
          },
        ),
      ],
    );
  }
}
