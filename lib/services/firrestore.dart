import 'package:cloud_firestore/cloud_firestore.dart';


class FirestoreService {

    final CollectionReference users =
        FirebaseFirestore.instance.collection('user');

        Future<void> addUser(String email, String username) {
          return users.add({
            'email': email,
            'username': username,
            
            
          });
        }
      
    
}