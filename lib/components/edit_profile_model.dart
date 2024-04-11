import 'package:flutter/material.dart';
import 'package:tasktrail/services/auth/auth_service.dart';

class EditProfile extends StatefulWidget {
  final bool isDarkMode;

  EditProfile({required this.isDarkMode});

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
        setState(() {
          selectedAvatar = imagePath;
        });

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
    final bool isDarkMode = widget.isDarkMode;

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.grey[900] : Colors.white,
      appBar: AppBar(
        title: Text("Edit Profile",
            style: TextStyle(
                color: isDarkMode ? Colors.white : Colors.black,
                fontWeight: FontWeight.w500)),
        backgroundColor: isDarkMode ? Colors.grey[900] : Colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 10),
            CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage(selectedAvatar),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _showAvatarEditor,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(15),
                backgroundColor: Color.fromRGBO(64, 106, 255, 1),
              ),
              child: Text(
                'Edit Avatar',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: 'Username',
                labelStyle:
                    TextStyle(color: isDarkMode ? Colors.white : Colors.black),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              enabled: false,
              controller: _emailController,
              decoration: InputDecoration(
                labelText: "Email Address",
                labelStyle:
                    TextStyle(color: isDarkMode ? Colors.white : Colors.black),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(15),
                  backgroundColor: Color.fromRGBO(64, 106, 255, 1),
                ),
                child: Text(
                  'Save',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
