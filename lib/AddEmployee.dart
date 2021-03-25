import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

import 'package:network/Employee.dart';
import 'package:network/EmployeeModel.dart';
import 'package:provider/provider.dart';

class NewEmployee extends StatefulWidget {
  NewEmployee({Key key, this.title = "Add Employee"}) : super(key: key);

  final String title;

  @override
  _NewEmployeeState createState() => _NewEmployeeState();
}

class _NewEmployeeState extends State<NewEmployee> {
  final Dio dio = Dio();
  Employee employee;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

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

            Consumer<EmployeeModel>(builder: (context, model, child) {
              return ElevatedButton(
                  onPressed: () {
                    Employee e = Employee(nameController.text, ageController.text);
                    model.createEmployee(e);
                    Navigator.pop(context);
                  },
                  child: Text("Add")
              );
            })
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
