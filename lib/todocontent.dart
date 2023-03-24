import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todofirestore/totodatas.dart';

class TodoContent extends StatefulWidget {
  const TodoContent({Key? key}) : super(key: key);

  @override
  State<TodoContent> createState() => _TodoContentState();
}

class _TodoContentState extends State<TodoContent> {
  TextEditingController titletextcontroller =TextEditingController();
  TextEditingController contenttextcontroller =TextEditingController();

  datadaaing() async {
    await FirebaseFirestore.instance
        .collection("TodoDatas")
        .add({"title": titletextcontroller.text,"content":contenttextcontroller.text});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Content "),backgroundColor:Colors.blue),
      body:Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: titletextcontroller,
              decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(

              controller: contenttextcontroller,
              decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
          ),
          ElevatedButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {

              return Tododatas();
            },));
            datadaaing();
          }, child: Text("add")),
        ],
      ) ,
    );
  }
}
