import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasktrail/services/firrestore.dart';

class ViewReq extends StatefulWidget {
  const ViewReq({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  _ViewReqState createState() => _ViewReqState();
}

class _ViewReqState extends State<ViewReq> {
  final FirestoreService firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        title: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 60.0),
            child: Text(
              'View Requests',
              style: GoogleFonts.poppins(
                color: const Color.fromARGB(255, 19, 19, 19),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: FutureBuilder<List>(
          future: firestoreService.getEnrolledList(widget.id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            if (snapshot.hasError) {
              return const Text('Error fetching enrolled list');
            }
            final enrolledList = snapshot.data;
            return ListView.builder(
              itemCount: enrolledList?.length,
              itemBuilder: (context, index) {
                final user = enrolledList?[index];
                return Container(
                  margin: EdgeInsets.only(top: 20, right: 20, left: 20),
                  child: Container(
                    decoration: const BoxDecoration(),
                    child: Row(
                      children: <Widget>[
                        const CircleAvatar(
                          radius: 35,
                          backgroundImage:
                              AssetImage('assets/images/avatar4.png'),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            children: <Widget>[
                              const SizedBox(height: 2),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Text(
                                      user['email'],
                                      overflow: TextOverflow.visible,
                                      style: GoogleFonts.poppins(
                                        color: const Color.fromARGB(
                                            255, 150, 150, 150),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            firestoreService
                                .deleteEnrolledUser(widget.id, user['email'])
                                .then((_) {
                              Future.delayed(Duration(seconds: 1), () {
                                setState(() {});
                              });
                            });
                          },
                          child: const CircleAvatar(
                            radius: 18,
                            backgroundColor: Color.fromARGB(255, 255, 56, 56),
                            child: Icon(
                              Icons.close,
                              size: 22,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            firestoreService
                                .updateEnrolledUserStatus(
                                    widget.id, user['email'], 'Approved')
                                .then((_) {
                              Future.delayed(Duration(seconds: 1), () {
                                setState(() {});
                              });
                            });
                          },
                          child: user['status'] == 'Approved'
                              ? const CircleAvatar(
                                  radius: 18,
                                  backgroundColor:
                                      Color.fromARGB(255, 255, 255, 255),
                                  child: Icon(Icons.check,
                                      size: 22, color: Colors.white),
                                )
                              : const CircleAvatar(
                                  radius: 18,
                                  backgroundColor:
                                      Color.fromARGB(255, 20, 199, 0),
                                  child: Icon(Icons.check,
                                      size: 22, color: Colors.white),
                                ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
