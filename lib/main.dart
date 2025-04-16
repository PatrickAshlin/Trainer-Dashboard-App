import 'package:flutter/material.dart';
import 'new_slot_booking_page.dart';

void main() => runApp(TrainerDashboardApp());

class TrainerDashboardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trainer Dashboard',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: TrainerDashboard(),
    );
  }
}

class TrainerDashboard extends StatelessWidget {
  final List<Map<String, String>> todaySessions = [
    {
      'time': '9:00 AM',
      'client': 'Patrick Ashlin',
      'type': 'Strength',
      'status': "Verified",
    },
    {
      'time': '11:00 AM',
      'client': 'Mathavan',
      'type': 'Cardio',
      'status': "pending",
    },
    {
      'time': '2:00 PM',
      'client': 'Surrender',
      'type': 'Yoga',
      'status': "Verified",
    },
  ];
  final List<Map<String, String>> upcominngSessions = [
    {
      'time': '3:00 PM',
      'client': 'Santhanam',
      'type': 'Chest',
      'status': "verified",
    },
    {
      'time': '4:00 PM',
      'client': 'Suresh',
      'type': 'Shoulder',
      'status': "pending",
    },
    {
      'time': '4:30 PM',
      'client': 'Karthik',
      'type': 'Legs',
      'status': "verified",
    },
    {'time': '5:00 PM', 'client': 'Vicky', 'type': 'Back', 'status': "pending"},
    {
      'time': '8:00 PM',
      'client': 'Dhanush',
      'type': 'Legs',
      'status': "verified",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trainer Dashboard'),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Good Morning, Ayush!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),

            // Stats Cards
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [_buildStatCard("Earnings", "\$450", Colors.blue)],
            ),
            SizedBox(height: 24),

            // Today's Sessions
            Text(
              'Today\'s Sessions',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 12),
            ...todaySessions
                .map((session) => _buildSessionCard(session))
                .toList(),
            Text(
              'Upcoming Sessions',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 12),
            ...upcominngSessions
                .map((session) => _buildSessionCard(session))
                .toList(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => NewSlotBookingPage()),
          );
        },
        icon: Icon(Icons.calendar_today),
        label: Text("New Booking"),
        backgroundColor: Colors.blueAccent,
      ),
    );
  }

  Widget _buildStatCard(String title, String value, Color color) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 6),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Text(title, style: TextStyle(fontSize: 16, color: Colors.black54)),
            SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSessionCard(Map<String, String> session) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(Icons.access_time, color: Colors.blue),
        title: Text(
          '${session['client']} - ${session['type']} - ${session['status']}',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text('${session['time']}'),
        trailing:
            todaySessions.contains(session) && session['status'] == "pending"
                ? Icon(Icons.pending, color: Colors.orange, size: 16)
                : upcominngSessions.contains(session) &&
                    session['status'] == "pending"
                ? Icon(Icons.pending, color: Colors.orange, size: 16)
                : Icon(Icons.check_circle, color: Colors.green, size: 16),
      ),
    );
  }
}
