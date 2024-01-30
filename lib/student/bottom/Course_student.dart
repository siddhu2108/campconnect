import 'package:flutter/material.dart';

class Course_student extends StatelessWidget {
  final List<String> courseNames = ['Math', 'Science', 'History', 'English'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: Icon(Icons.account_circle_outlined),
        title: Text("Campus Connect"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.edit, color: Colors.black),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: courseNames.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.manage_accounts_outlined),
            title: Text(courseNames[index]),
            onTap: () {
              // Handle onTap for each course
              print('Course tapped: ${courseNames[index]}');

              // Navigate to a new screen with the selected course name
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SelectedCourseScreen(
                    courseName: courseNames[index],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class SelectedCourseScreen extends StatelessWidget {
  final String courseName;

  SelectedCourseScreen({
    required this.courseName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(courseName),
        elevation: 0.0,
      ),
      body: Center(
        child: Text(
          'Details for $courseName will be displayed here.',
          style: TextStyle(fontSize: 18.0),
        ),
      ),
    );
  }
}
