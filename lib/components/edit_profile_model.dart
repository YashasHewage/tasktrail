import 'package:flutter/material.dart';
import 'package:tasktrail/pages/settings_page.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
    );
  }
}
