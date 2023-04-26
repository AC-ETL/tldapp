import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dao/widgets/material/progress/internet_check_progress.dart';
import 'package:flutter/material.dart';

class Skills extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<QueryDocumentSnapshot>>(
      future: getSkills(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Display a loading indicator while fetching data
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          // Display an error message if an error occurs
          return Text('Error: ${snapshot.error}');
        } else {
          // If data is available, print the documents
          List<QueryDocumentSnapshot> documents = snapshot.data ?? [];
          print("Number of documents: ${documents.length}");
          documents.forEach((doc) {
            print("Document ID: ${doc.id}");
            print("Document Data: ${doc.data()}"); // Update this line
          });
          // Return the UI for displaying the chips
          return Container(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
              child: Wrap(
                  spacing: 10,
                  children: documents.map((doc) {
                    Map<String, dynamic> data = doc.data()
                        as Map<String, dynamic>; // Cast to Map<String, dynamic>
                    String image = data['image'] ?? '';
                    String name = data['name'] ?? '';
                    return Chip(
                      label: Text(name),
                      avatar: image.isNotEmpty
                          ? CircleAvatar(
                              backgroundImage: NetworkImage(image),
                              backgroundColor: Colors.white,
                            )
                          : null,
                      backgroundColor: Colors.white,
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      elevation: 5,
                    );
                  }).toList()),
            ),
          );
        }
      },
    );
  }

  // Function to get all documents from the "skills" collection
  Future<List<QueryDocumentSnapshot>> getSkills() async {
    try {
      // Get the Firestore instance
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      // Query the "skills" collection
      QuerySnapshot snapshot = await firestore.collection("skills").get();

      // Return the list of documents
      return snapshot.docs;
    } catch (e) {
      print("Error getting skills: $e");
      return [];
    }
  }
}
