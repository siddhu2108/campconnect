import 'package:campus1/admin/admin_dashboard.dart';
import 'package:campus1/admin/create/office.dart';
import 'package:campus1/admin/create/student.dart';
import 'package:campus1/admin/create/teacher.dart';
import 'package:campus1/componants/mybutton.dart';

import 'package:flutter/material.dart';

class createuser extends StatefulWidget {
  @override
  _CreateUserState createState() => _CreateUserState();
}

class _CreateUserState extends State<createuser> {
  TextEditingController username = TextEditingController();
  TextEditingController Password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  String selectedRole = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Create User'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => DashboardScreen()),
            );
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.group_add, size: 80, color: Colors.black),
              const SizedBox(height: 30),
              Text(
                "C A M P U S  C O N N E C T",
                style: TextStyle(fontSize: 30),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildRadio("Teacher", "teacher"),
                  buildRadio("Student", "student"),
                  buildRadio("Office Staff", "office_staff"),
                ],
              ),
              const SizedBox(height: 20),
              mybutton(
                text: "Create Account",
                onTap: () {
                  // Handle Create Account based on selected role
                  switch (selectedRole) {
                    case "teacher":
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TeacherRegistration(),
                        ),
                      );
                      break;
                    case "student":
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StudentRegistration(),
                        ),
                      );
                      break;
                    case "office_staff":
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OfficeStaffRegistration(),
                        ),
                      );
                      break;
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRadio(String title, String value) {
    return Row(
      children: [
        Radio(
          value: value,
          groupValue: selectedRole,
          onChanged: (String? newValue) {
            setState(() {
              selectedRole = newValue!;
            });
          },
        ),
        Text(title),
      ],
    );
  }
}
