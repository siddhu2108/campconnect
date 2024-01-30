import 'package:campus1/admin/create_user.dart';
import 'package:campus1/componants/mybutton.dart';
import 'package:campus1/componants/mytextfield.dart';
import 'package:flutter/material.dart';

class OfficeStaffRegistration extends StatefulWidget {
  @override
  State<OfficeStaffRegistration> createState() =>
      _OfficeStaffRegistrationState();
}

class _OfficeStaffRegistrationState extends State<OfficeStaffRegistration> {
  TextEditingController officeStaffField1 = TextEditingController();

  TextEditingController officeStaffField2 = TextEditingController();

  TextEditingController officeStaffField3 = TextEditingController();

  TextEditingController officeStaffMobileNumberController =
      TextEditingController();

  TextEditingController officeStaffEmailController = TextEditingController();

  TextEditingController officeStaffDepartmentController =
      TextEditingController();

  TextEditingController officeStaffDesignationController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Office Staff Register'),
        elevation: 0.0,
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
                Icon(Icons.business, size: 80, color: Colors.black),
                const SizedBox(height: 30),
                Text(
                  "C A M P U S  C O N N E C T",
                  style: TextStyle(fontSize: 30),
                ),
                const SizedBox(height: 30),
                mytextfield(
                  hinttext: "Username",
                  obsecure: false,
                  controller: officeStaffField1,
                  icon: Icons.person,
                ),
                const SizedBox(height: 15),
                mytextfield(
                  hinttext: "Password",
                  obsecure: true,
                  controller: officeStaffField2,
                  icon: Icons.lock,
                ),
                const SizedBox(height: 15),
                mytextfield(
                  hinttext: "Confirm Password",
                  obsecure: true,
                  controller: officeStaffField3,
                  icon: Icons.lock_clock,
                ),
                const SizedBox(height: 15),
                mytextfield(
                  hinttext: "Mobile Number",
                  obsecure: false,
                  controller: officeStaffMobileNumberController,
                  icon: Icons.phone,
                ),
                const SizedBox(height: 15),
                mytextfield(
                  hinttext: "Email",
                  obsecure: false,
                  controller: officeStaffEmailController,
                  icon: Icons.email,
                ),
                const SizedBox(height: 15),
                mytextfield(
                  hinttext: "Department",
                  obsecure: false,
                  controller: officeStaffDepartmentController,
                  icon: Icons.business,
                ),
                const SizedBox(height: 15),
                mytextfield(
                  hinttext: "Designation",
                  obsecure: false,
                  controller: officeStaffDesignationController,
                  icon: Icons.work,
                ),
                const SizedBox(height: 15),
                // Add more fields as needed
                mybutton(text: "Create Account", onTap: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
