import 'package:GSTCalc/AddGST.dart';
import 'package:GSTCalc/RemoveGST.dart';
import 'package:flutter/material.dart';

class AddGst extends StatefulWidget {
  @override
  _AddGstState createState() => _AddGstState();
}

class _AddGstState extends State<AddGst> {
  @override
  Widget build(BuildContext context) {
    List<Widget> scaffolds = [
      MaterialApp(
        debugShowCheckedModeBanner: false,
      home: AddGST()
      ),
       MaterialApp(
        debugShowCheckedModeBanner: false,
      home: RemoveGST()
       )
    ];
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Color(0xff2D2929),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text('GST', style: TextStyle(color: Colors.yellow)),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: 'Add',
              ),
              Tab(
                text: 'REMOVE',
              )
            ],
          ),
        ),
        body: TabBarView(
          children: scaffolds,
        ),
      ),
    );
  }
}
