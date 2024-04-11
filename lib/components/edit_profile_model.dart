import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tasktrail/services/auth/auth_service.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  bool isSwitched = false;
  String selectedAvatar =
      'assets/images/avatar1.png'; // Default selected avatar

  final TextEditingController _emailController = TextEditingController();

  final AuthService authService = AuthService();

  void initState() {
    super.initState();
    _emailController.text = authService.getEmail(); // Set default email value
  }

  void _showAvatarEditor() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 300,
          padding: EdgeInsets.all(20),
          child: GridView.count(
            crossAxisCount: 3, // Number of columns
            crossAxisSpacing: 10, // Spacing between columns
            mainAxisSpacing: 10, // Spacing between rows
            children: [
              _buildAvatar('assets/images/avatar1.png'),
              _buildAvatar('assets/images/avatar2.png'),
              _buildAvatar('assets/images/avatar3.png'),
              _buildAvatar('assets/images/avatar4.png'),
              _buildAvatar('assets/images/avatar5.png'),
              _buildAvatar('assets/images/avatar6.png'),
            ],
          ),
        );
      },
    );
  }

  Widget _buildAvatar(String imagePath) {
    return GestureDetector(
      onTap: () {
        // Update the selected avatar path when an avatar is tapped
        setState(() {
          selectedAvatar = imagePath;
        });
        // Close the bottom sheet after selecting an avatar
        Navigator.of(context).pop();
      },
      child: CircleAvatar(
        radius: 70,
        backgroundImage: AssetImage(imagePath),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        title: const Text(" Edit Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 40),
            CircleAvatar(
              radius: 70,
              backgroundImage:
                  AssetImage(selectedAvatar), // Use selected avatar here
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _showAvatarEditor,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(15),
                backgroundColor: const Color.fromRGBO(
                    64, 106, 255, 1), // Color of the "Save" button
              ),
              child: Text(
                'Edit Avatar',
                style: TextStyle(color: Colors.white), // Text color
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: 'User Name',
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              enabled: false,
              controller: _emailController, // Disable editing
              decoration: InputDecoration(
                labelText: "Email Address",
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(15),
                    backgroundColor: const Color.fromRGBO(64, 106, 255, 1),
                  ),
                  child: const Text(
                    'Save',
                    style: TextStyle(color: Colors.white),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
