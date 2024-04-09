import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  //add a New user
  final CollectionReference users =
      FirebaseFirestore.instance.collection('user');

  Future<void> addUser(String email, String username) {
    return users.add({
      'email': email,
      'username': username,
    });
  }

  // get user by email
  Future<DocumentSnapshot> getUserByEmail(String email) {
    return users.where('email', isEqualTo: email).get().then((value) {
      return value.docs.first;
    });
  } 


  //add a New job
  final CollectionReference jobs =
      FirebaseFirestore.instance.collection('jobs');

  Future<void> addJob(
      String title, String description, int price, int slots, String address) {
    return jobs.add({
      'title': title,
      'description': description,
      'price': price,
      'slots': slots,
      'address': address,
      'createdAt': Timestamp.now(),
    });
  }

  // fetch all jobs
  Stream<QuerySnapshot> getJobs() {
    final jobsStream = jobs.orderBy('createdAt', descending: true).snapshots();

    return jobsStream;
  }
}
