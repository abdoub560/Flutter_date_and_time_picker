import 'package:flutter/material.dart';
import 'package:learning/widgets/date_picker_widget.dart';
import 'package:learning/widgets/date_time_picker_widget.dart';
import 'package:learning/widgets/time_picker_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(children: [
        DatePickerWidget(),
        SizedBox(
          height: 50,
        ),
        TimePickerWidget(),
        SizedBox(
          height: 50,
        ),
        DateTimePickerWidget()
      ]),
    );
  }
}
