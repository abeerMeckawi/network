import 'package:flutter/material.dart';
import 'package:network/EmployeeModel.dart';
import 'package:provider/provider.dart';

import 'AddEmployee.dart';
import 'Employee.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    Provider.of<EmployeeModel>(context, listen: false).getAllEmployee();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder(
          future: Provider.of<EmployeeModel>(context,listen: false).getAllEmployee(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(
                child: Center(
                  child: Text("Loading..."),
                ),
              );
            } else {
              return Consumer<EmployeeModel>(
                builder: (context, model, child) {
                  return ListView.builder(
                    itemCount: model.employees.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(model.employees[index].name),
                        subtitle: Text("Age " + model.employees[index].age),
                      );
                    },
                  );
                },
              );
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
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
