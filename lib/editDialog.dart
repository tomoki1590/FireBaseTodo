import 'package:flutter/material.dart';

class EditDialog extends StatefulWidget {
  const EditDialog({Key? key}) : super(key: key);

  @override
  _EditDialogState createState() => _EditDialogState();
}

//TextEditingController _textEditingController;


class _EditDialogState extends State<EditDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: TextField(
        //controller: _textEditingController,
        decoration: InputDecoration(
          labelText: "Todoを追加してね",
          hintText: "記入例(筋トレ１０回)", hintStyle: (
            TextStyle(color: Colors.cyan)),
        ),
      ),
    );
  }
}
