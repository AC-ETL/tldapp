import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../model/session_data.dart';

//  Here is the products class with ChangeNotifier
class SessionDataProvider with ChangeNotifier {

  final List<SessioinsData> _sessions = [
    // SessioinsData(
    //   approve: true,
    //   startTime: DateTime.now(),
    //   title: 'Javascript',
    //   instructor: 'Muhammad sajid',
    //   poins: '70',
    //   endTime: DateTime.now(),
    //   tags: ['java', 'Python'],
    //   image:
    //       'https://images.unsplash.com/photo-1579468118864-1b9ea3c0db4a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80.jpg',
    //   students: ['Sajid', 'Amir'],
    // ),
    // SessioinsData(
    //   approve: true,
    //   startTime: DateTime.now(),
    //   title: 'React js',
    //   instructor: 'Muhammad Arslan',
    //   poins: '70',
    //   endTime: DateTime.now(),
    //   tags: ['java', 'Python'],
    //   image:
    //       'https://images.unsplash.com/photo-1633356122102-3fe601e05bd2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80.jpg',
    //   students: ['Sajid', 'Amir'],
    // ),
    // SessioinsData(
    //   approve: true,
    //   startTime: DateTime.now(),
    //   title: 'Node js',
    //   instructor: 'Muhammad Arslan',
    //   poins: '70',
    //   endTime: DateTime.now(),
    //   tags: ['java', 'Python'],
    //   image:
    //       'https://blog.schoolofnet.com/wp-content/uploads/2018/02/img-nodejs.jpg',
    //   students: ['Sajid', 'Amir'],
    // ),
    // SessioinsData(
    //   approve: true,
    //   startTime: DateTime.now(),
    //   title: 'Angular js',
    //   instructor: 'Muhammad Arslan',
    //   poins: '70',
    //   endTime: DateTime.now(),
    //   tags: ['java', 'Python'],
    //   image:
    //       'https://opensource.google/images/projects/os-projects-angular_thumbnail.png',
    //   students: ['Sajid', 'Amir'],
    // ),
    // SessioinsData(
    //   approve: true,
    //   startTime: DateTime.now(),
    //   title: 'Flutter js',
    //   instructor: 'Muhammad Arslan',
    //   poins: '70',
    //   endTime: DateTime.now(),
    //   tags: ['java', 'Python'],
    //   image:
    //       'https://thurrott.s3.amazonaws.com/2019/05/flutter-mobile-web-desktop.jpg',
    //   students: ['Sajid', 'Amir'],
    // )
  ];

  //  Here is getter to access the parivate class _item......
  List<SessioinsData> get sessions {
    return _sessions;
  }

//  In a Dart one thig is import is data type you have to define a currect datatype....👺👺

  // SessioinsData findById(String productId) {
  //   // return _items.firstWhere((prod) => prod.id == productId);
  //   // ...
  // }

  void addProductd() {
    // _item.add(value);
    notifyListeners();
  }
//  Here fetching the data and add to private_sessions List....
  fetchData() async {
    var data =
        FirebaseFirestore.instance.collection("sessions").get().then((value) {
      // print(value.docs[0].data());
      value.docs.forEach((element) {
        _sessions.add(SessioinsData.fromJson(element.data()));
      });
    });
   // notifyListeners();
    
  }
}
