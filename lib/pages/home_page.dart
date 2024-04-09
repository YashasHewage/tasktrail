import 'package:flutter/material.dart';
import 'package:tasktrail/components/my_drawer.dart';
import 'package:tasktrail/components/my_sliver_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Mydrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
        MySliverAppBar(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Welcome to Task Trail'),
                Text('Your one stop for all your tasks'),
              ],
            
          ),
            title: Text('Task Trail'),
            
        ],
        body: Container(color: Colors.blue),
      ),
    );
  }
}
