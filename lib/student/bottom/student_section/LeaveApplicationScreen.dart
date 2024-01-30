import 'package:campus1/componants/mytextfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;

  const MyButton({Key? key, required this.text, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black),
        ),
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blue[900],
            ),
          ),
        ),
      ),
    );
  }
}

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hinttext;
  final IconData icon;
  final bool? obsecure;

  const MyTextField({
    Key? key,
    required this.controller,
    required this.hinttext,
    required this.icon,
    required this.obsecure,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obsecure ?? false,
      decoration: InputDecoration(
        hintText: hinttext,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(),
      ),
    );
  }
}

class LeaveApplicationScreen extends StatefulWidget {
  @override
  _LeaveApplicationScreenState createState() => _LeaveApplicationScreenState();
}

class _LeaveApplicationScreenState extends State<LeaveApplicationScreen> {
  final TextEditingController _reasonController = TextEditingController();

  DateTime? startDate;
  DateTime? endDate;

  String? selectedLeaveType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Leave Application'),
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Leave Type:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            DropdownButton<String>(
              items: [
                DropdownMenuItem(
                  value: 'Vacation',
                  child: Text('Vacation'),
                ),
                DropdownMenuItem(
                  value: 'Sick Leave',
                  child: Text('Sick Leave'),
                ),
                // Add more leave types as needed
              ],
              onChanged: (value) {
                // Handle leave type selection
                setState(() {
                  selectedLeaveType = value;
                });
              },
              hint: Text('Select leave type'),
            ),
            SizedBox(height: 16.0),
            Text(
              'Leave Dates:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            MyButton(
              text: startDate != null && endDate != null
                  ? 'Selected Dates: ${DateFormat('MM/dd/yyyy').format(startDate!)} - ${DateFormat('MM/dd/yyyy').format(endDate!)}'
                  : 'Select Dates',
              onTap: () => _selectLeaveDates(context),
            ),
            SizedBox(height: 16.0),
            Text(
              'Reason for Leave:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            mytextfield(
              controller: _reasonController,
              hinttext: 'Enter reason for leave',
              icon: Icons.edit,
              obsecure: false,
            ),
            SizedBox(height: 16.0),
            MyButton(
              text: 'Submit Application',
              onTap: () => _submitLeaveApplication(context),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectLeaveDates(BuildContext context) async {
    DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 30)),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.blue, // Change the primary color
            secondaryHeaderColor: Colors.black, // Change the accent color
            colorScheme: ColorScheme.light(
              primary: Colors.blue, // Change the primary color
            ),
            buttonTheme: ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked.start != null && picked.end != null) {
      setState(() {
        startDate = picked.start;
        endDate = picked.end;
      });
    }
  }

  void _submitLeaveApplication(BuildContext context) {
    if (_reasonController.text.isEmpty || selectedLeaveType == null) {
      print('Please fill in all fields!');
      return;
    }

    // Perform your logic with the selected data
    print('Selected Leave Type: $selectedLeaveType');
    print('Selected Start Date: $startDate');
    print('Selected End Date: $endDate');
    print('Reason: ${_reasonController.text}');

    Navigator.pop(context);
  }
}
