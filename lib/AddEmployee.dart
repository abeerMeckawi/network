import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'dart:convert';

import 'package:network/Employee.dart';


class NewEmployee extends StatefulWidget {
  NewEmployee({Key key, this.title="Add Employee"}) : super(key: key);

  final String title;

  @override
  _NewEmployeeState createState() => _NewEmployeeState();
}

class _NewEmployeeState extends State<NewEmployee> {
  final Dio dio = Dio();
  Employee employee;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  Future<Employee> createEmployee(Employee employee) {
    dio.options.headers.putIfAbsent("Accept", () {
      return "application/json";
    });
    return dio
        .post("http://dummy.restapiexample.com/api/v1/create", data: employee)
        .then((d) {

      return new Employee.fromJson(d as Map);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: TextField(
              controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Employee Name',
                  hintText: 'Employee Name',
                ),
              ),
          ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                controller: ageController,
                decoration: InputDecoration(
                  labelText: 'Employee Age',
                  hintText: 'Employee Age',
                ),
              ),
            ),
            SizedBox(height: 32),
            employee == null ? Container():
                Text("The Employee ${employee.name} is created successfully"),
            ElevatedButton(onPressed: (){
              Employee e = Employee(nameController.text,ageController.text);
              createEmployee(e);
              setState(() {
                employee = e;
              });
            }
            , child: Text(
                  "Add"
                )
            )
          ],
        ),

      ),
 // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

