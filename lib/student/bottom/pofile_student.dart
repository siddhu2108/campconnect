import 'dart:math';
import 'package:flutter/material.dart';
import 'package:campus1/componants/my_text.dart';

class ProfileCard extends StatelessWidget {
  final Map<String, dynamic> studentDetails;

  ProfileCard({required this.studentDetails});
  Color generateRandomColor() {
    Random random = Random();
    return Color.fromARGB(
      90,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }

  @override
  Widget build(BuildContext context) {
    Color _color = generateRandomColor();
    var color = generateRandomColor();
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50.0),
                    topRight: Radius.circular(0.0),
                  ),
                ),
                padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
                child: Row(
                  children: [
                    // Circular Image
                    Container(
                      height: 100,
                      width: 100,
                      padding: EdgeInsets.all(6.0),
                      child: Stack(
                        children: [
                          ClipOval(
                            child: Image.asset(
                              "assets/person.jpg", // Replace with student's image
                              height: 120,
                              width: 120,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 16.0),
                    // User Info
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText(
                            text:
                                'Name: ${capitalizeFirstLetter(studentDetails['stud_name'] ?? '')}',
                            fw: FontWeight.bold,
                            textsize: 15.0,
                          ),
                          MyText(
                            text: 'ID: ${studentDetails['id'] ?? ''}',
                            fw: FontWeight.normal,
                            textsize: 15.0,
                          ),
                          MyText(
                            text: capitalizeFirstLetter(
                              'Dept: ${studentDetails['dept']} [ ${studentDetails['class'] ?? ''} ]',
                            ),
                            fw: FontWeight.normal,
                            textsize: 15.0,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),

              // Additional Fields
              buildDataContainer(
                'PRN',
                studentDetails['prn'] ?? '',
                Icons.person,
                color: color,
                dataSize: 20.0,
              ),
              buildDataContainer(
                'Semester',
                studentDetails['semester'] ?? '',
                Icons.book,
                color: Colors.deepOrange[100]!,
                dataSize: 20.0,
              ),
              buildDataContainer(
                'Class',
                studentDetails['class'] ?? '',
                Icons.school,
                color: Colors.green[100]!,
                dataSize: 20.0,
              ),
              buildDataContainer(
                'Division',
                studentDetails['division'] ?? '',
                Icons.category,
                color: Colors.teal[100]!,
                dataSize: 20.0,
              ),
              buildDataContainer(
                'Eligibility',
                studentDetails['eligibility'] ?? '',
                Icons.check_circle,
                color: Colors.pink[100]!,
                dataSize: 20.0,
              ),
              buildDataContainer(
                'Adhar Card',
                studentDetails['adharCard'] ?? '',
                Icons.credit_card,
                color: Colors.blue[100]!,
                dataSize: 20.0,
              ),
              buildDataContainer(
                'Pan Card',
                studentDetails['panCard'] ?? '',
                Icons.credit_card,
                color: Colors.yellow[100]!,
                dataSize: 20.0,
              ),
              buildDataContainer(
                'Email',
                studentDetails['email'] ?? '',
                Icons.email,
                color: Colors.red[100]!,
                dataSize: 20.0,
              ),
              buildDataContainer(
                'Mobile',
                studentDetails['mobileNumber'] ?? '',
                Icons.phone,
                color: Colors.purple[100]!,
                dataSize: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDataContainer(String label, String data, IconData icon,
      {required Color color, required double dataSize}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4.0),
        padding: EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.black,
              size: dataSize,
            ),
            SizedBox(width: 12.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MyText(
                text: ('$label\n$data'),
                fw: FontWeight.normal,
                textsize: dataSize,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String capitalizeFirstLetter(String text) {
    if (text.isEmpty) return text;
    return text.toUpperCase();
  }
}
