<<<<<<< HEAD
import 'dart:ffi';

=======
import 'package:cloud_firestore/cloud_firestore.dart';
>>>>>>> de2d2cf77ea86cc31a088549eb8969686fc21265
import 'package:flutter/material.dart';
import 'package:tasktrail/components/my_drawer.dart';
import 'package:tasktrail/components/my_job_tile.dart';
import 'package:tasktrail/components/my_sliver_app_bar.dart';
import 'package:tasktrail/services/firrestore.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  final FirestoreService firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      drawer: const Mydrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MySliverAppBar(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
<<<<<<< HEAD
                //image insert
=======
>>>>>>> de2d2cf77ea86cc31a088549eb8969686fc21265
                Image.asset(
                  'assets/images/landingpage.png',
                  height: 200,
                ),

                // Divider(
                //   indent: 25,
                //   endIndent: 25,
                //   color: Theme.of(context).colorScheme.secondary,
                // ),
              ],
            ),
          ),
        ],
<<<<<<< HEAD
        body: Padding(
          padding: const EdgeInsets.only(left: 24),
          child: ListView(
            children: const [
              JobCard(
                  jobTitle: "fuck",
                  price: "fuck",
                  availableSlots: "fuck",
                  address: "fuck",
                  jobType: "fuck"),
              SizedBox(height: 20),
              JobCard(
                  jobTitle: "fuck",
                  price: "afdafd",
                  availableSlots: "fadfdads",
                  address: "fadsfads",
                  jobType: "dafasd"),
            ],
          ),
=======
        body: StreamBuilder<QuerySnapshot>(
          stream: firestoreService.getJobs(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final doc = snapshot.data!.docs[index];
                return JobCard(
                  jobTitle: doc['title'],
                  price: doc['price'].toString(),
                  availableSlots: doc['slots'].toString(),
                  address: doc['address'],
                  jobType: doc['category'].toString(),
                  documentId: doc.id,
                );
              },
            );
          },
>>>>>>> de2d2cf77ea86cc31a088549eb8969686fc21265
        ),
      ),
    );
  }
}
