import 'package:campus1/componants/mybutton.dart';
import 'package:campus1/componants/mytextfield.dart';
import 'package:flutter/material.dart';

class BonafideRequestScreen extends StatefulWidget {
  @override
  _BonafideRequestScreenState createState() => _BonafideRequestScreenState();
}

class _BonafideRequestScreenState extends State<BonafideRequestScreen> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _rollNumberController = TextEditingController();
  final TextEditingController _reasonController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bonafide Request'),
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            mytextfield(
              controller: _userNameController,
              hinttext: 'Name',
              icon: Icons.person,
              obsecure: false,
            ),
            SizedBox(height: 16.0),
            mytextfield(
              controller: _rollNumberController,
              hinttext: 'Roll No',
              icon: Icons.nine_k,
              obsecure: false,
            ),
            SizedBox(height: 16.0),
            mytextfield(
              controller: _reasonController,
              hinttext: 'Reason for Bonafide Request:',
              icon: Icons.edit,
              obsecure: false,
            ),
            SizedBox(height: 8.0),
            mybutton(
                text: "Submit Request",
                onTap: () {
                  _submitBonafideRequest(context);
                }),
          ],
        ),
      ),
    );
  }

  void _submitBonafideRequest(BuildContext context) {
    try {
      // Validate form data before proceeding
      if (_userNameController.text.isEmpty ||
          _rollNumberController.text.isEmpty ||
          _reasonController.text.isEmpty) {
        // Show an error message or use a SnackBar
        print('Please fill in all fields!');
        return;
      }

      // Implement your logic for handling the bonafide request with the entered information.

      // For now, you can print the entered data.
      print('User Name: ${_userNameController.text}');
      print('Roll Number: ${_rollNumberController.text}');
      print('Reason: ${_reasonController.text}');

      // You can proceed with your logic here, such as making an API call, etc.

      // Optionally, you can navigate back to the previous screen.
      Navigator.pop(context);
    } catch (e, stackTrace) {
      print('Error: $e');
      print(stackTrace);
    }
  }
}
