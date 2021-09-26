import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  const MyHomePage(),);
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var todo ="";
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<void> fetchTaskList ()async{
  final snapshot = await FirebaseFirestore.instance.collection('name').get();
  todo = snapshot.docs.first.data() ['todo'];
  setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchTaskList ();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(todo,
          style:  const TextStyle(
            fontSize: 35.0
          ),
          //style: (
            //fontWeight: FontWeight.w700,
            //fontSize: 35.0
          ),
          ),
      );
  }
}
