import 'package:firebase/firestore.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:untitled/add.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // これをつけないとなぜか怒られる。
  await Firebase.initializeApp();
  runApp(const MyApp());
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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String todo = "";
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> fetchTaskList() async {
    final snapshot = await FirebaseFirestore.instance.collection('name').get();
    todo = snapshot.docs.first.data()['todo'];
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchTaskList();
  }

  final items = List<String>.generate(10, (i) => "Item $i");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, int position) {
            return ListTile(
              title: Text('$todo'),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: null,      ),
      // Text(todo,
      // style: TextStyle(
      // color: Colors.pink,
      // fontWeight: FontWeight.w700,
      //fontSize: 35.0

      //),
    );
  }
}

class Task {
  Task({
    required this.todo,
    required this.done,
    required this.deadline,
    //required this.ref,
  });

  final String todo;
  final bool done;
  final DateTime deadline;
//final DocumentReference.ref<Map<String, dynamic>>? ref;




}
