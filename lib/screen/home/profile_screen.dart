import 'package:flutter/material.dart';
import '../screen.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 218, 245, 227),
        appBar: AppBar(
          title: const Text('profile'),
          backgroundColor: Colors.white,
          shadowColor: Colors.transparent,
        ),
        body: const Center(
          child: Text(
            'ProfilePage .....',
            style: TextStyle(
              fontSize: 60,
            ),
          ),
        ),
      ),
    );
  }
}
