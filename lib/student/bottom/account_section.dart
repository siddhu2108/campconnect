import 'package:flutter/material.dart';
import 'package:campus1/componants/my_text.dart';

class AccountSection extends StatefulWidget {
  final Map<String, dynamic> studentDetails;

  AccountSection({required this.studentDetails});

  @override
  State<AccountSection> createState() => _AccountSectionState();
}

class _AccountSectionState extends State<AccountSection> {
  // Sample user-specific data (replace with actual data)
  String userName = 'Mr. RAVINDRA';

  String branch = 'Computer Engineering';

  String course = 'BE [A]';

  double totalFee = 5000.0;

  double feePaid = 3000.0;

  double remainingFee = 2000.0;

  bool isLatePayment = false;

  // Change based on late payment status
  DateTime? lastPaymentDate;

  // Set if payment has been made
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
            icon: Icon(Icons.not_interested, color: Colors.black),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        padding: EdgeInsets.all(8.0),
                        child: Stack(
                          children: [
                            ClipOval(
                              child: Image.asset(
                                "assets/person.jpg",
                                height: 120,
                                width: 120,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 16.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyText(
                              text:
                                  'Name : ${widget.studentDetails['stud_name'].toUpperCase() ?? ''}',
                              fw: FontWeight.bold,
                              textsize: 15.0,
                            ),
                            MyText(
                              text:
                                  'Department : ${widget.studentDetails['dept'].toUpperCase()}',
                              fw: FontWeight.normal,
                              textsize: 14.0,
                            ),
                            MyText(
                              text:
                                  'Class :  ${widget.studentDetails['class'].toUpperCase()}',
                              fw: FontWeight.normal,
                              textsize: 14.0,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Fee Structure:',
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10.0),
                  _buildFeeStructureTable(),
                  SizedBox(height: 20.0),
                  _buildPaymentStatus(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFeeStructureTable() {
    return DataTable(
      columns: [
        DataColumn(label: Text('Details')),
        DataColumn(label: Text('Amount')),
      ],
      rows: [
        DataRow(cells: [
          DataCell(Text('Total Fee')),
          DataCell(Text('\$$totalFee')),
        ]),
        DataRow(cells: [
          DataCell(Text('Fee Paid')),
          DataCell(Text('\$$feePaid')),
        ]),
        DataRow(cells: [
          DataCell(Text('Remaining Fee')),
          DataCell(Text('\$$remainingFee')),
        ]),
      ],
    );
  }

  Widget _buildPaymentStatus() {
    String status = isLatePayment ? 'Late Payment' : 'On Time';
    String lastPayment = lastPaymentDate != null
        ? 'Last Payment Date: ${lastPaymentDate.toString()}'
        : 'No payments made yet';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Payment Status: $status',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: isLatePayment ? Colors.red : Colors.green,
          ),
        ),
        SizedBox(height: 8.0),
        Text(
          lastPayment,
          style: TextStyle(fontSize: 14.0),
        ),
      ],
    );
  }
}
