import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SessionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Session List'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('sessions').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            final sessions = snapshot.data?.docs ?? [];

            return ListView.builder(
              itemCount: sessions.length,
              itemBuilder: (context, index) {
                final session = sessions[index];
                final title = session['title'] as String?;
                final description = session['description'] as String?;
                final instructorId = session['instructor'] as String?;

                return FutureBuilder<DocumentSnapshot>(
                  future: instructorId != null
                      ? FirebaseFirestore.instance
                          .collection('users')
                          .doc(instructorId)
                          .get()
                      : null,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                          child: SizedBox(
                              height: 1, child: LinearProgressIndicator()));
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      final user =
                          snapshot.data?.data() as Map<String, dynamic>?;

                      final instructorUid = user?['uid'] as String?;

                      return ListTile(
                        title: Text(
                          title ?? 'N/A',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 8.0),
                            Text(
                              description ?? 'N/A',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.grey[700],
                              ),
                            ),
                            SizedBox(height: 4.0),
                            Text(
                              'Instructor UID: ${instructorUid ?? 'N/A'}',
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 12.0,
                          horizontal: 16.0,
                        ),
                        tileColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(
                            color: Colors.grey.shade300,
                            width: 1.0,
                          ),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          size: 18.0,
                          color: Colors.grey[700],
                        ),
                        // Add SizedBox to add 8 pixels of vertical spacing
                        // between each ListTile
                        minVerticalPadding: 4,
                        visualDensity: VisualDensity(vertical: 1.0),
                      );
                    }
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
