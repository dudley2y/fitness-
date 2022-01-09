import 'package:flutter/material.dart';
// ignore: implementation_imports

class DataBaseRetrieve extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DataBaseRetrieve();
}

class _DataBaseRetrieve extends State<DataBaseRetrieve> {
  @override
  Widget build(BuildContext context) {
    return Text("foobar");
  }
}

// void printDBInfo(String uid) {
//   final dbs = DatabaseService(uid: uid);
//   var foo;
//   var idk = dbs.getUserSplitNames().then((value) {
//     foo = value;
//     print(value.docs.length);
//   }).catchError((onError) {
//     print(onError);
//   });
//   print('not yet');
// }
