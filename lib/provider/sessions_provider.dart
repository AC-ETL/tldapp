import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../model/session_data.dart';

//  Here is the products class with ChangeNotifier
class SessionDataProvider with ChangeNotifier {
  final List<SessioinsData> _items = [];

  //  Here is getter to access the parivate class _item......
  List<SessioinsData> get items {
    return [..._items];
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
}


// fetchData() async {
//   var data = FirebaseFirestore.instance.collection("sessions").snapshots();
//   data.map((value) {
//     // print(value.docs[0]);

//     // List<QueryDocumentSnapshot<SessioinsData>> sessionData=value.docs!.forEach((element) { });

//     value.docs.forEach((element) {
//       setState(() {
//        items.add(SessioinsData.fromJson(element.data()));
//       });

// //
//     });
//   }).toList();
// }
