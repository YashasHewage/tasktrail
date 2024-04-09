import 'package:flutter/material.dart';

class JobDetails extends StatelessWidget {
  final String id;

  const JobDetails({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Job Details"),
      ),
    );
  }
}
