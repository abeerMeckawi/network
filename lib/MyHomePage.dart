import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'dart:convert';

import 'AddEmployee.dart';
import 'Employee.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Dio dio = Dio();

 Future<List<Employee>> getAllEmployee() {
   return dio.get('http://dummy.restapiexample.com/api/v1/employees').then((d) {
     print(d.toString());

     return (d.data['data'] as List).map((employee) => Employee.fromJson(employee)).toList();
   });
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: FutureBuilder(
         future:getAllEmployee() ,
          builder: (BuildContext context , AsyncSnapshot snapshot){
           if(snapshot.data == null){
             return Container(
               child: Center(
                 child: Text("Loading..."),
               ),
             );
           }
           else {
             return ListView.builder(
               itemCount: snapshot.data.length,
               itemBuilder: (BuildContext context, int index) {
                 return ListTile(
                   title: Text(
                       snapshot.data[index].name
                   ),
                   subtitle: Text("Age "+snapshot.data[index].age),
                 );
               },
             );
           }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NewEmployee()),
          );
        },
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}