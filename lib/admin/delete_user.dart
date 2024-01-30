import 'package:campus1/admin/admin_dashboard.dart';
import 'package:campus1/componants/mybutton.dart';
import 'package:campus1/componants/mytextfield.dart';
import 'package:flutter/material.dart';

class delete_user extends StatelessWidget {
  TextEditingController username = TextEditingController();

  delete_user({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Delete User'),
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
              Icon(Icons.group_remove, size: 80, color: Colors.black),
              const SizedBox(height: 30),
              Text(
                "C A M P U S  C O N N E C T",
                style: TextStyle(fontSize: 30),
              ),
              const SizedBox(height: 30),
              mytextfield(
                  hinttext: "Username",
                  obsecure: false,
                  controller: username,
                  icon: Icons.person),
              const SizedBox(height: 10),
              mybutton(
                  text: "Delete Account",
                  onTap: () {
                    // Handle delete logic here
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
