import 'package:flutter/material.dart';

class ListDisplay extends StatefulWidget {
  const ListDisplay({Key? key}) : super(key: key);

  @override
  State createState() => DyanmicList();
}

class DyanmicList extends State<ListDisplay> {
  List<String> litems = [];
  final TextEditingController eCtrl = TextEditingController();
  @override
  Widget build (BuildContext context) {
    return Scaffold(  
      // appBar: AppBar(title:const Text("Dynamic Demo"),),
      body: Column(
        children: <Widget>[
          TextField(
            controller: eCtrl,
            onSubmitted: (text) {
              if(text.isNotEmpty){
              litems.add(text);

              }
              eCtrl.clear();
              setState(() {});
            },
          ),
          Expanded(
            child: ListView.builder
              (
                itemCount: litems.length,
                itemBuilder: (BuildContext ctxt, int index) {
                  return Text(litems[index]);
                }
            )
        )
        ],
      )
    );
  }
}