class Job {
  final String title;
  final String description;
  final double price;
  final int availableSlots;
  final String address;
  final JobType jobType;

  Job({
    required this.title,
    required this.description,
    required this.price,
    required this.availableSlots,
    required this.address,
    required this.jobType,
  });
}

enum JobType {
  fullTime,
  partTime,
  remote,
}
