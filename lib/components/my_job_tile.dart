import 'package:flutter/material.dart';
import 'package:tasktrail/pages/home_page.dart';
import 'package:tasktrail/pages/job_details.dart';

class JobCard extends StatelessWidget {
  final String jobTitle;
  final String price;
  final String availableSlots;
  final String address;
  final String jobType;

  const JobCard({
    Key? key,
    required this.jobTitle,
    required this.price,
    required this.availableSlots,
    required this.address,
    required this.jobType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.secondary,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                jobTitle,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Text(
                'Price: $price',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              Text(
                'Available Slots: $availableSlots',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              Text(
                'Address: $address',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              Text(
                'Job Type: $jobType',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}