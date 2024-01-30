import 'package:campus1/admin/create_user.dart';
import 'package:campus1/admin/delete_user.dart';
import 'package:campus1/admin/update_user.dart';
import 'package:campus1/admin/viewBar.dart';
import 'package:campus1/login/desk.dart';
import 'package:campus1/main.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  // Function to show bottom sheet
  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          // Customize the appearance of your bottom sheet as needed
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DashboardCard(
                icon: Icons.create,
                title: 'Create Account',
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => createuser()),
                  );
                },
                color: Colors.blue.shade400,
                subtitle: '',
              ),

              // Update Account Card
              DashboardCard(
                icon: Icons.edit_document,
                title: 'Update Account',
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => update()),
                  );
                },
                color: Colors.green.shade400,
                subtitle: '',
              ),
              // Delete Account Card
              DashboardCard(
                icon: Icons.delete,
                title: 'Delete Account',
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => delete_user()),
                  );
                },
                color: Colors.pink.shade400,
                subtitle: '',
              ),

              // Logout Card
              DashboardCard(
                icon: Icons.exit_to_app_sharp,
                title: 'Logout',
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => DesktopLoginPage()),
                  );
                },
                color: Colors.red.shade400,
                subtitle: '',
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Dashboard'),
        elevation: 0.0,
        actions: [
          IconButton(
            icon: Icon(Icons.attribution),
            onPressed: () {
              // Handle notifications action
              _showBottomSheet(context);
            },
          ),
          IconButton(
            icon: Icon(Icons.bar_chart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BarGraph()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Handle notifications action
              _showBottomSheet(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Four Activities
            ListTile(
              title: Text('Total Users'),
              subtitle: Text('100'),
              leading: CircleAvatar(
                backgroundColor: Colors.purple.shade200,
                child: Icon(Icons.people, color: Colors.white),
              ),
              onTap: () {
                // Handle Total Users tap
              },
            ),
            ListTile(
              title: Text('No of Students'),
              subtitle: Text('50'),
              leading: CircleAvatar(
                backgroundColor: Colors.green.shade200,
                child: Icon(Icons.person_2, color: Colors.white),
              ),
              onTap: () {
                // Handle No of Students tap
              },
            ),
            ListTile(
              title: Text('No of Teachers'),
              subtitle: Text("40"),
              leading: CircleAvatar(
                backgroundColor: Colors.orange.shade200,
                child: Icon(Icons.school, color: Colors.white),
              ),
              onTap: () {
                // Handle No of Teachers tap
              },
            ),
            ListTile(
              title: Text('No of Office Staff'),
              subtitle: Text('20'),
              leading: CircleAvatar(
                backgroundColor: Colors.red.shade200,
                child: Icon(Icons.business, color: Colors.white),
              ),
              onTap: () {
                // Handle No of Office Staff tap
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final Color color;

  const DashboardCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.1,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color,
          child: Icon(icon, color: Colors.white),
        ),
        title: Text(title),
        subtitle: Text(subtitle),
        onTap: onTap,
      ),
    );
  }
}
