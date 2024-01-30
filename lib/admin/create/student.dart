import 'dart:io';
import 'package:campus1/admin/create_user.dart';
import 'package:campus1/componants/mybutton.dart';
import 'package:campus1/componants/mytextfield.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class StudentRegistration extends StatefulWidget {
  StudentRegistration({Key? key}) : super(key: key);

  @override
  _StudentRegistrationState createState() => _StudentRegistrationState();
}

class _StudentRegistrationState extends State<StudentRegistration> {
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController mobileNoController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController deptController = TextEditingController();
  TextEditingController semesterController = TextEditingController();
  TextEditingController classController = TextEditingController();
  TextEditingController divController = TextEditingController();
  TextEditingController prnController = TextEditingController();
  TextEditingController eligibilityController = TextEditingController();
  TextEditingController adharController = TextEditingController();
  TextEditingController panCardController = TextEditingController();

  Future<void> registerStudent() async {
    // Validation checks
    if (passwordController.text != confirmPasswordController.text) {
      showSnackbar("Passwords do not match");
      return;
    }

    if (!validateEmail(emailController.text)) {
      showSnackbar("Invalid email address");
      return;
    }

    // Add more validation checks as needed

    // Make API call
    var api_end = "http://172.17.2.17/campus/";
    final response = await http.post(
      Uri.parse("${api_end}register_student.php"),
      body: {
        'name': nameController.text,
        'username': usernameController.text,
        'password': passwordController.text,
        'confirmPassword': confirmPasswordController.text,
        'mobileNumber': mobileNoController.text,
        'email': emailController.text,
        'dept': deptController.text,
        'semester': semesterController.text,
        'class': classController.text,
        'division': divController.text,
        'prn': prnController.text,
        'eligibility': eligibilityController.text,
        'adharCard': adharController.text,
        'panCard': panCardController.text,
      },
    );
    void clearControllers() {
      nameController.clear();
      usernameController.clear();
      passwordController.clear();
      confirmPasswordController.clear();
      mobileNoController.clear();
      emailController.clear();
      deptController.clear();
      semesterController.clear();
      classController.clear();
      divController.clear();
      prnController.clear();
      eligibilityController.clear();
      adharController.clear();
      panCardController.clear();
    }

    if (response.statusCode == 200) {
      showSnackbar("Registration successful");
      clearControllers();
    } else {
      showSnackbar("Error: ${response.statusCode}");
    }
  }

  void showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.blue[900],
        content: Text(
          message,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  bool validateEmail(String email) {
    // Add your email validation logic here
    // This is a simple example, you may want to use a regex for a more comprehensive check
    return email.contains('@');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Student Register'),
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.person, size: 80, color: Colors.black),
                const SizedBox(height: 30),
                Text(
                  "C A M P U S  C O N N E C T",
                  style: TextStyle(fontSize: 30),
                ),
                const SizedBox(height: 30),
                mytextfield(
                  hinttext: "Name",
                  obsecure: false,
                  controller: nameController,
                  icon: Icons.person,
                ),
                const SizedBox(height: 15),
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
                  controller: mobileNoController,
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
                  hinttext: "Department",
                  obsecure: false,
                  controller: deptController,
                  icon: Icons.category,
                ),
                const SizedBox(height: 15),
                mytextfield(
                  hinttext: "Semester",
                  obsecure: false,
                  controller: semesterController,
                  icon: Icons.book,
                ),
                const SizedBox(height: 15),
                mytextfield(
                  hinttext: "Class",
                  obsecure: false,
                  controller: classController,
                  icon: Icons.school,
                ),
                const SizedBox(height: 15),
                mytextfield(
                  hinttext: "Division",
                  obsecure: false,
                  controller: divController,
                  icon: Icons.grid_view,
                ),
                const SizedBox(height: 15),
                mytextfield(
                  hinttext: "PRN",
                  obsecure: false,
                  controller: prnController,
                  icon: Icons.format_list_numbered,
                ),
                const SizedBox(height: 15),
                mytextfield(
                  hinttext: "Eligibility",
                  obsecure: false,
                  controller: eligibilityController,
                  icon: Icons.badge,
                ),
                const SizedBox(height: 15),
                mytextfield(
                  hinttext: "Adhar Card",
                  obsecure: false,
                  controller: adharController,
                  icon: Icons.credit_card,
                ),
                const SizedBox(height: 15),
                mytextfield(
                  hinttext: "PAN Card",
                  obsecure: false,
                  controller: panCardController,
                  icon: Icons.credit_card,
                ),
                // Add more fields as needed
                const SizedBox(height: 15),
                mybutton(
                    text: "Create Account",
                    onTap: () {
                      registerStudent();
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
