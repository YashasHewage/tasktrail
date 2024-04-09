import 'package:flutter/material.dart';

class JobDetailsPage extends StatelessWidget {
  final String jobTitle;
  final String price;
  final String availableSlots;
  final String address;
  final String jobType;

  const JobDetailsPage({
    Key? key,
    required this.jobTitle,
    required this.price,
    required this.availableSlots,
    required this.address,
    required this.jobType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(jobTitle),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Price: $price',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 18,
              ),
            ),
            Text(
              'Available Slots: $availableSlots',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 18,
              ),
            ),
            Text(
              'Address: $address',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 18,
              ),
            ),
            Text(
              'Job Type: $jobType',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 18,
              ),
            ),
            // Add more details here
          ],
        ),
      ),
    );
  }
}
