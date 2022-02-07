import 'package:flutter/material.dart';
import 'package:flutter_freezed/model/Person.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Freezed',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  renderText(String title, String text) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )
          ],
        ),
        Row(
          children: [
            Text(
              text,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )
          ],
        ),
        Divider(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final person1 = Person(id: 1, name: 'riudiu', age: 22);
    return Scaffold(
      appBar: AppBar(
        title: Text('flutter freezed'),
        centerTitle: true,
        elevation: 0.5,
      ),
      body: Center(
        child: Column(
            // children: [renderText('person1.id', person1.id.toString())],
            ),
      ),
    );
  }
}
