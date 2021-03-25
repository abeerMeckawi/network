import 'package:flutter/material.dart';
import 'package:network/EmployeeModel.dart';
import 'package:provider/provider.dart';

import 'MyHomePage.dart';

void main() {
      runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => EmployeeModel(),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: MyHomePage(title: 'Employees'),
        ));

  }
}

