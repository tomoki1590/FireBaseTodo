import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/main/main_model.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MainModel>(create: (context){
        return MainModel();
      },
child:Consumer<MainModel>(
builder:(context,model,child) {
  return Scaffold(
      appBar: AppBar(title: const Text("TodoProvider"),
  ),
  body: Container(),
  );
}
        )



      );
  }
}
