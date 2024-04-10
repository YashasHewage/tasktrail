import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  //add a New user
  final CollectionReference users =
      FirebaseFirestore.instance.collection('user');

  Future<void> addUser(String email, String username, int imageNumber) {
    return users.add({
      'email': email,
      'username': username,
      'imageId': imageNumber,
    });
  }

  // get user by email
  Future<DocumentSnapshot> getUserByEmail(String email) {
    return users.where('email', isEqualTo: email).get().then((value) {
      return value.docs.first;
    });
  }

  // get imageNumber by email
  Future<int> getUserImageNumberByEmail(String email) {
    return users.where('email', isEqualTo: email).get().then((value) {
      return value.docs.first['imageId'];
    });
  }

  //add a New job
  final CollectionReference jobs =
      FirebaseFirestore.instance.collection('jobs');

  Future<void> addJob(String title, String description, int price, int slots,
      String address, String category, String contact, String ownerEmail) {
    return jobs.add({
      'title': title,
      'description': description,
      'price': price,
      'slots': slots,
      'address': address,
      'category': category,
      'contact': contact,
      'ownerEmail': ownerEmail,
      'createdAt': Timestamp.now(),
    });
  }

  // fetch all jobs
  Stream<QuerySnapshot> getJobs() {
    final jobsStream = jobs.orderBy('createdAt', descending: true).snapshots();

    return jobsStream;
  }

  // fetch my ads
  Stream<QuerySnapshot> getMyAds(String ownerEmail) {
    final jobsStream1 =
        jobs.where('ownerEmail', isEqualTo: ownerEmail).snapshots();

    return jobsStream1;
  }

  //delete a job
  Future<void> deleteJob(String documentId) {
    return jobs.doc(documentId).delete();
  }
}
