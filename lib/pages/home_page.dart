import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:tasktrail/components/my_drawer.dart';
import 'package:tasktrail/components/my_job_tile.dart';
import 'package:tasktrail/components/my_sliver_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

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
                //image insert
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
        ),
      ),
    );
  }
}
