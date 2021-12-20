import 'package:flutter/material.dart';
import 'package:sqflite_test/database/memo.dart';
import 'package:sqflite_test/database/db.dart';

class EditPage extends StatelessWidget {
  String title = '';
  String text = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.save),
              onPressed: saveDB,
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              TextField(
                onChanged: (String title) {
                  this.title = title;
                },
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                  hintText: '메모의 제목을 적어주세요.',
                ),
              ),
              Padding(padding: EdgeInsets.all(10)),
              TextField(
                onChanged: (String text) {
                  this.text = text;
                },
                decoration: InputDecoration(
                  hintText: '메모의 내용을 적어주세요.',
                ),
              ),
            ],
          ),
        ));
  }

  Future<void> saveDB() async {
    DBHelper sd = DBHelper();

    var fido = Memo(
      id: 3,
      title: this.title,
      text: this.text,
      createTime: DateTime.now().toString(),
      editTime: DateTime.now().toString(),
    );

    await sd.insertMemo(fido);

    print(await sd.memos());
  }
}
