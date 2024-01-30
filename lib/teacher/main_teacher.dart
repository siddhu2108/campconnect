import 'package:flutter/material.dart';

class TeacherDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> subjects = [
      "Subject 1",
      "Subject 2",
      "Subject 3",
      "Subject 4",
      "Subject 5",
      "Subject 6"
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("CAMPUS CONNECT"),
        elevation: 0.0,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: SafeArea(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: 6,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 180, // Increase the height as needed
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _buildSubjectCard(subjects[index], index),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildSubjectCard(String subject, int index) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Container(
          height: 200,
          width: double.minPositive,
          margin: EdgeInsets.symmetric(horizontal: 12.0),
          padding: EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                _generateRandomColor(index),
                _generateRandomColor(index),
              ],
              begin: Alignment.topLeft,
              end: Alignment.topRight,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                subject,
                style: TextStyle(
                  color: _getTextColor(_generateRandomColor(index)),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              // Add more details or actions related to the subject
              Text(
                "related to $subject hello world from ",
                style: TextStyle(
                  color: _getTextColor(_generateRandomColor(index)),
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _generateRandomColor(int index) {
    // Custom colors with opacity
    List<Color> customColors = [
      Colors.red.withOpacity(1.0),
      Colors.pink.withOpacity(1.0),
      Colors.purple.withOpacity(1.0),
      Colors.teal.withOpacity(1.0)
    ];

    // Select a color from the customColors list based on the index
    return customColors[index % customColors.length];
  }

  Color _getTextColor(Color backgroundColor) {
    // Calculate brightness based on the background color
    double brightness = backgroundColor.computeLuminance();

    // Use white text for dark backgrounds and black text for light backgrounds
    return brightness < 0.5 ? Colors.white : Colors.black;
  }
}
