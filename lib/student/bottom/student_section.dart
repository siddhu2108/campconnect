import 'package:campus1/componants/mybutton.dart';
import 'package:campus1/student/bottom/student_section/LeaveApplicationScreen.dart';
import 'package:campus1/student/bottom/student_section/bona_request.dart';
import 'package:flutter/material.dart';

class student_section extends StatefulWidget {
  @override
  _student_sectionState createState() => _student_sectionState();
}

class _student_sectionState extends State<student_section> {
  bool isBottomSheetVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        leading: Icon(Icons.account_circle_outlined),
        title: Text("Campus Connect"),
        actions: [
          IconButton(
            onPressed: () {
              _showBottomSheet(context);
            },
            icon: Icon(Icons.edit, color: Colors.black),
          ),
        ],
      ),
      body: ListDocument(),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ClipRRect(
          child: Container(
            constraints: BoxConstraints(
              minHeight: 80.0, // Adjust the minimum height as needed
            ),
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                mybutton1(
                    icon: Icons.close,
                    onTap: () => Navigator.of(context).pop()),
                SizedBox(
                  height: 10,
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: mybutton(
                        text: "BONAFIDE",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BonafideRequestScreen()),
                          );
                        })),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: mybutton(
                      text: "LEAVE CERTIFICATE",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LeaveApplicationScreen()),
                        );
                      }),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class mybutton1 extends StatelessWidget {
  final VoidCallback onTap;
  final IconData? icon;

  mybutton1({
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Icon(
        icon,
        size: 24,
      ),
    );
  }
}

class ListDocument extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CustomListDocument(
            icon: Icons.insert_page_break_sharp,
            title: 'Bonafide',
            subtitle: 'reason',
            date: '22/12/23'),

        //2
        CustomListDocument(
            icon: Icons.sick,
            title: 'leave',
            subtitle: 'reason',
            date: '22/12/23'),

        //3
        CustomListDocument(
            icon: Icons.pageview,
            title: 'Bonafide',
            subtitle: 'reason',
            date: '22/12/23'),
      ],
    );
  }
}

class CustomListDocument extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final String? date;

  const CustomListDocument({
    required this.icon,
    required this.title,
    this.subtitle,
    this.date,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.blue[900],
      ),
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle!) : null,
      trailing: Text(
        date!,
        style: TextStyle(color: Colors.black),
      ),
      onTap: () {},
    );
  }
}
