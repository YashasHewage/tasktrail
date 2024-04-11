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
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        title: const Text("Profile",
            style: TextStyle(fontWeight: FontWeight.w500)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 160,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(146, 143, 255, 0.2),
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
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(authService.getEmail())
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
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditProfile(),
                              ),
                            );
                          },
                          iconSize: 25,
                          color: const Color.fromARGB(255, 100, 100, 100),
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
            const Row(
              children: [
                Text(
                  "Settings",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
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
                    color: const Color.fromRGBO(146, 143, 255, 0.2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 20.0),
                              child: Text(
                                "Dark Mode",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // CupertinoSwitch(
                            //   value: _switchValue,
                            //   onChanged: (value) {
                            //     setState(() {
                            //       _switchValue = value;
                            //     });
                            //   },
                            // ),
                            Padding(
                              padding: EdgeInsets.only(right: 20.0),
                              child: IconButton(
                                  onPressed: null,
                                  icon: Icon(
                                    Icons.toggle_off_sharp,
                                    size: 42,
                                    color: Color.fromARGB(255, 133, 133, 133),
                                  )),
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
