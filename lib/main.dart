import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
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
  Future<void> firebaseTaskList ()async{
  final snapshot = await FirebaseFirestore.instance.collection('name').get();
  todo = snapshot.docs.first.data() ['todo'];
  setState(() {});
  }

  @override
  void initState() {
    super.initState();
    firebaseTaskList();
  }
  final items = List<String>.generate(10, (i) => "Item $i");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context,int position) {
            return ListTile(
              title: Text('$todo'),
            );
          },
        ),
      ),
        floatingActionButton: FloatingActionButton(
          child:  Icon(Icons.add),
          onPressed: ()=> print("押したでー"),
        ),
        //Text(todo,
         // style: TextStyle(
           //   color: Colors.pink,
             // fontWeight: FontWeight.w700,
              //fontSize: 35.0

        //),
      
    );
  }
}
