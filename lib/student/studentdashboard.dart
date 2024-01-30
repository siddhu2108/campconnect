import 'package:campus1/login/mobile.dart';
import 'package:campus1/student/bottom/Course_student.dart';
import 'package:campus1/student/bottom/account_section.dart';
import 'package:campus1/student/bottom/home_student.dart';
import 'package:campus1/student/bottom/pofile_student.dart';
import 'package:campus1/student/bottom/student_section.dart';
import 'package:flutter/material.dart';

class StudentDashboard1 extends StatefulWidget {
  const StudentDashboard1({Key? key, required this.studentDetails})
      : super(key: key);

  final Map<String, dynamic> studentDetails;

  @override
  _StudentDashboard1State createState() => _StudentDashboard1State();
}

class _StudentDashboard1State extends State<StudentDashboard1> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _currentIndex == 0
          ? AppBar(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text('Campus Connect'),
                      SizedBox(width: 8.0),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => mobileLogin()),
                          );
                        },
                        icon: Icon(Icons.chat, color: Colors.black, size: 20),
                      ),
                      SizedBox(width: 8.0),
                      Icon(
                        Icons.notifications,
                        size: 20,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ],
              ),
              elevation: 0.0,
            )
          : null,
      body: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    final List<Widget> _pages = [
      HomeScreen(),
      Course_student(),
      student_section(),
      AccountSection(
        studentDetails: widget.studentDetails,
      ),
      ProfileCard(
        studentDetails: widget.studentDetails,
      ),
    ];

    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.blue[900],
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.my_library_books_rounded),
            label: 'Course',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school_rounded),
            label: 'Student',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.credit_card),
            label: 'Account',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
