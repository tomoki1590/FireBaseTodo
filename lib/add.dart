import 'package:flutter/material.dart';

class ListAdd extends StatefulWidget {
  const ListAdd({Key? key}) : super(key: key);

  @override
  _ListAddState createState() => _ListAddState();
}

class _ListAddState extends State<ListAdd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("リスト一覧"),),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(),
          ],
        ),
      ),
    );
  }
}
