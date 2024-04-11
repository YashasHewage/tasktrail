import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasktrail/services/auth/auth_service.dart';
import 'package:tasktrail/services/firrestore.dart';

class TaskView extends StatefulWidget {
  final String id;

  TaskView({Key? key, required this.id}) : super(key: key);

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  final FirestoreService firestoreService = FirestoreService();
  final AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: firestoreService.getJobById(widget.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            color: const Color.fromARGB(
                255, 255, 255, 255), // replace with your desired color
            child: const Center(child: CircularProgressIndicator()),
          );
        }
        if (snapshot.hasError) {
          return const Text('Error fetching job details');
        }
        final jobData = snapshot.data!.data() as Map<String, dynamic>;
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.tertiary,
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.tertiary,
            title: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 60.0),
                child: Text(
                  'Advertisement View',
                  style: GoogleFonts.poppins(
                    color: const Color.fromARGB(255, 19, 19, 19),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          body: LayoutBuilder(
            builder: (context, constraints) {
              return Container(
                color: Theme.of(context).colorScheme.tertiary,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0, right: 16.0, bottom: 100),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          jobData['title'],
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                            onPressed: () {
                              firestoreService.enrollUser(
                                  widget.id, authService.getEmail());
                            },
                            child: const Text("meka change karanna epa")),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color.fromARGB(255, 163, 163, 163),
                              width: 1,
                            ),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.only(top: 25, bottom: 25),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: [
                                        CircleAvatar(
                                          radius: 35,
                                          backgroundColor:
                                              const Color(0xFFDBE3FF),
                                          child: Container(
                                            width: 25,
                                            height: 25,
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/images/briefcase.png'),
                                                fit: BoxFit.cover,
                                                filterQuality:
                                                    FilterQuality.high,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(top: 6),
                                          child: Text(
                                            'Category',
                                            style: GoogleFonts.poppins(
                                              color: const Color(0xFF777B8A),
                                              fontSize: 13,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(top: 6),
                                          child: Text(
                                            jobData['category'],
                                            style: GoogleFonts.poppins(
                                              color: const Color(0xFF121212),
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        CircleAvatar(
                                          radius: 35,
                                          backgroundColor:
                                              const Color(0xFFDBFFEC),
                                          child: Container(
                                            width: 30,
                                            height: 30,
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/images/salary.png'),
                                                filterQuality:
                                                    FilterQuality.high,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(top: 6),
                                          child: Text(
                                            'Payment',
                                            style: GoogleFonts.poppins(
                                              color: const Color(0xFF777B8A),
                                              fontSize: 13,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(top: 6),
                                          child: Text(
                                            'Rs ' + jobData['price'].toString(),
                                            style: GoogleFonts.poppins(
                                              color: const Color(0xFF121212),
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        CircleAvatar(
                                          radius: 35,
                                          backgroundColor:
                                              const Color(0xFFFFDBDB),
                                          child: Container(
                                            width: 30,
                                            height: 25,
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/images/slots.png'),
                                                fit: BoxFit.cover,
                                                filterQuality:
                                                    FilterQuality.high,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(top: 6),
                                          child: Text(
                                            'Vacancies',
                                            style: GoogleFonts.poppins(
                                              color: const Color(0xFF777B8A),
                                              fontSize: 13,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(top: 6),
                                          child: Text(
                                            jobData['slots'].toString(),
                                            style: GoogleFonts.poppins(
                                              color: const Color(0xFF121212),
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 30),
                          child: Text(
                            'Date & Time',
                            style: GoogleFonts.poppins(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(108, 105, 189, 1)),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 5),
                          child: Text(
                            jobData['createdAt'].toString(),
                            style: GoogleFonts.poppins(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 30),
                          child: Text(
                            'Description',
                            style: GoogleFonts.poppins(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(108, 105, 189, 1)),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          child: Text(
                            jobData['description'],
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              height: 1.8,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          floatingActionButton: Container(
            margin: const EdgeInsets.only(bottom: 20),
            width: 320,
            child: FloatingActionButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.32,
                      child: SingleChildScrollView(
                        child: Container(
                          margin: const EdgeInsets.only(
                              top: 30, left: 20, right: 20),
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: [
                                  Text(
                                    'About the Advertiser',
                                    style: GoogleFonts.poppins(
                                      color: const Color(0xFF928FFF),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              FutureBuilder<DocumentSnapshot>(
                                future: firestoreService
                                    .getUserByEmail(jobData['ownerEmail']),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const CircularProgressIndicator();
                                  }
                                  if (snapshot.hasError) {
                                    return const Text(
                                        'Error fetching user details');
                                  }
                                  final userData = snapshot.data!.data()
                                      as Map<String, dynamic>;
                                  return Row(
                                    children: <Widget>[
                                      CircleAvatar(
                                        radius: 35,
                                        backgroundImage: AssetImage(
                                            'assets/images/avatar${userData['imageId']}.png'),
                                      ),
                                      const SizedBox(width: 15),
                                      Expanded(
                                        child: Column(
                                          children: <Widget>[
                                            Row(
                                              children: <Widget>[
                                                Expanded(
                                                  child: Text(
                                                    userData['username'],
                                                    overflow:
                                                        TextOverflow.visible,
                                                    style: GoogleFonts.poppins(
                                                      color:
                                                          const Color.fromARGB(
                                                              255, 27, 27, 27),
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 2),
                                            Row(
                                              children: <Widget>[
                                                Expanded(
                                                  child: Text(
                                                    jobData['ownerEmail'],
                                                    overflow:
                                                        TextOverflow.visible,
                                                    style: GoogleFonts.poppins(
                                                      color:
                                                          const Color.fromARGB(
                                                              255,
                                                              150,
                                                              150,
                                                              150),
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      const CircleAvatar(
                                        radius: 22,
                                        backgroundColor: Color(0xFF928FFF),
                                        child: Icon(Icons.phone, size: 22),
                                      ),
                                      const SizedBox(width: 10),
                                      const CircleAvatar(
                                        radius: 22,
                                        backgroundColor: Color(0xFF928FFF),
                                        child: Icon(Icons.mail, size: 22),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
              child: Text(
                'Enroll Now',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              backgroundColor: Color.fromARGB(255, 67, 98, 235),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
        );
      },
    );
  }
}
