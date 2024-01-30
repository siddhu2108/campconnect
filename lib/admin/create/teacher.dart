import 'package:campus1/admin/create_user.dart';
import 'package:campus1/componants/mybutton.dart';
import 'package:campus1/componants/mytextfield.dart';
import 'package:flutter/material.dart';

class TeacherRegistration extends StatefulWidget {
  @override
  State<TeacherRegistration> createState() => _TeacherRegistrationState();
}

class _TeacherRegistrationState extends State<TeacherRegistration> {
  // Text editing controllers for the fields
  TextEditingController usernameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  TextEditingController mobileNumberController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController subjectsController = TextEditingController();

  TextEditingController classController = TextEditingController();

  TextEditingController divController = TextEditingController();

  TextEditingController deptController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Teacher Register'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => createuser()),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.school, size: 80, color: Colors.black),
                const SizedBox(height: 30),
                Text(
                  "C A M P U S  C O N N E C T",
                  style: TextStyle(fontSize: 30),
                ),
                const SizedBox(height: 30),
                mytextfield(
                  hinttext: "Username",
                  obsecure: false,
                  controller: usernameController,
                  icon: Icons.person,
                ),
                const SizedBox(height: 15),
                mytextfield(
                  hinttext: "Password",
                  obsecure: true,
                  controller: passwordController,
                  icon: Icons.lock,
                ),
                const SizedBox(height: 15),
                mytextfield(
                  hinttext: "Confirm Password",
                  obsecure: true,
                  controller: confirmPasswordController,
                  icon: Icons.lock_clock,
                ),
                const SizedBox(height: 15),
                mytextfield(
                  hinttext: "Mobile Number",
                  obsecure: false,
                  controller: mobileNumberController,
                  icon: Icons.phone,
                ),
                const SizedBox(height: 15),
                mytextfield(
                  hinttext: "Email",
                  obsecure: false,
                  controller: emailController,
                  icon: Icons.email,
                ),
                const SizedBox(height: 15),
                mytextfield(
                  hinttext: "Departmet",
                  obsecure: false,
                  controller: deptController,
                  icon: Icons.engineering,
                ),
                const SizedBox(height: 15),
                mytextfield(
                  hinttext: "Class",
                  obsecure: false,
                  controller: classController,
                  icon: Icons.looks_one,
                ),
                const SizedBox(height: 15),
                mytextfield(
                  hinttext: "Div",
                  obsecure: false,
                  controller: divController,
                  icon: Icons.person_4,
                ),
                const SizedBox(height: 15),
                mytextfield(
                  hinttext: "Subjects",
                  obsecure: false,
                  controller: subjectsController,
                  icon: Icons.book,
                ),
                const SizedBox(height: 15),
                mybutton(text: "Create Account", onTap: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
