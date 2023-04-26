import 'package:cloud_firestore/cloud_firestore.dart';

class ApiService {
  Future<List<Map<String, dynamic>>> getUsers(bool condition) async {
    List<Map<String, dynamic>> result = [];
    CollectionReference usersCollection =
        FirebaseFirestore.instance.collection('users');

    if (condition) {
      QuerySnapshot querySnapshot =
          await usersCollection.where('feature', isEqualTo: true).get();
      for (QueryDocumentSnapshot doc in querySnapshot.docs) {
        if (doc.data() != null) {
          Map<String, dynamic> docData = doc.data()! as Map<String, dynamic>;
          result.add({'id': doc.id, ...docData});
        }
      }
    } else {
      QuerySnapshot querySnapshot = await usersCollection.get();
      for (QueryDocumentSnapshot doc in querySnapshot.docs) {
        if (doc.data() != null) {
          Map<String, dynamic> docData = doc.data()! as Map<String, dynamic>;
          result.add({'id': doc.id, ...docData});
        }
      }
    }

    return result;
  }
}
