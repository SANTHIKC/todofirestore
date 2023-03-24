import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Tododatas extends StatefulWidget {
  const Tododatas({Key? key}) : super(key: key);

  @override
  State<Tododatas> createState() => _TododatasState();
}

class _TododatasState extends State<Tododatas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("TodoDatas").snapshots() ,
        builder: (context,snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting)
            {
              return Center(child: CircularProgressIndicator(),);
            }
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context,index) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                    child:Column(
                      children: [
                        Text(snapshot.data!.docs[index].data()["title"]),
                        Text(snapshot.data!.docs[index].data()["content"]),
                      ],
                    ),
                  ),
                );
              }
            );
          }
          else
            {
              return Text("somthing wrong");
            }
        }
      ),
    );
  }
}
