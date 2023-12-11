import 'package:flutter/material.dart';
import 'db_helper.dart';

class MainScreen extends StatelessWidget {
  final DBHelper dbHelper = DBHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Screen'),
      ),
      body: FutureBuilder<User?>(
        future: dbHelper.getUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError || snapshot.data == null) {
            return const Text('No user data available');
          } else {
            final user = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Username: ${user.username}'),
                  const SizedBox(height: 10),
                  Text('Phone: ${user.phone}'),
                  const SizedBox(height: 10),
                  Text('Email: ${user.email}'),
                  const SizedBox(height: 10),
                  Text('Address: ${user.address}'),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
