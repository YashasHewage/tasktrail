import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tasktrail/components/edit_profile_model.dart';
import 'package:tasktrail/services/auth/auth_service.dart';
import 'package:tasktrail/services/firrestore.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  bool _switchValue = false;

  final AuthService authService = AuthService();
  final FirestoreService firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _switchValue
          ? Colors.grey[900]
          : Colors.white, // Adjust dark mode background color
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(
              fontWeight: FontWeight.w500,
              color: _switchValue ? Colors.white : Colors.black),
        ),
        centerTitle: true,
        backgroundColor: _switchValue ? Colors.grey[900] : Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 160,
              decoration: BoxDecoration(
                color: _switchValue
                    ? Colors.grey[800]
                    : const Color.fromRGBO(
                        146, 143, 255, 0.2), // Adjust dark mode container color
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FutureBuilder<DocumentSnapshot>(
                          future: firestoreService
                              .getUserByEmail(authService.getEmail()),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const CircularProgressIndicator();
                            }
                            if (snapshot.hasError) {
                              return const Text('Error fetching user details');
                            }
                            final userData =
                                snapshot.data!.data() as Map<String, dynamic>;
                            return Row(
                              children: [
                                Image(
                                  image: AssetImage(
                                      "assets/images/avatar${userData['imageId']}.png"),
                                  height: 90,
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        userData['username'],
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: _switchValue
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                      ),
                                      Text(
                                        authService.getEmail(),
                                        style: TextStyle(
                                          color: _switchValue
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            // Navigate to EditProfile when edit button is pressed
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    EditProfile(isDarkMode: _switchValue),
                              ),
                            );
                          },
                          iconSize: 25,
                          color: _switchValue
                              ? Colors.white
                              : const Color.fromARGB(255, 100, 100,
                                  100), // Adjust icon color based on theme
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Text(
                  "Settings",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: _switchValue
                        ? Colors.white
                        : Colors.black, // Adjust text color based on theme
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  // alignment: Alignment.center,
                  width: 380,
                  height: 60,
                  decoration: BoxDecoration(
                    color: _switchValue
                        ? Colors.grey[800]
                        : const Color.fromRGBO(146, 143, 255,
                            0.2), // Adjust dark mode container color
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Text(
                                "Dark Mode",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                                  color: _switchValue
                                      ? Colors.white
                                      : Colors
                                          .black, // Adjust text color based on theme
                                ),
                              ),
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  _switchValue =
                                      !_switchValue; // Toggle the switch value
                                  // You can add logic here to update the theme based on _switchValue
                                });
                              },
                              icon: Icon(
                                _switchValue
                                    ? Icons.toggle_on
                                    : Icons.toggle_off,
                                size: 42,
                                color: _switchValue
                                    ? Colors.green
                                    : Colors
                                        .grey, // Adjust icon color based on theme
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 350,
            ),
            const Column(
              children: [
                Text(
                  "Version 1.0.0",
                  style: TextStyle(
                    color: Color.fromRGBO(155, 155, 155, 1),
                  ),
                ),
                Text(
                  "© 2024 TaskTrail",
                  style: TextStyle(
                    color: Color.fromRGBO(155, 155, 155, 1),
                  ),
                ),
                Text(
                  "All Rights Reserved.",
                  style: TextStyle(
                    color: Color.fromRGBO(155, 155, 155, 1),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
