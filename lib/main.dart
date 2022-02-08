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
    final person2 = Person(id: 1, name: 'riudiu', age: 22);

    // freezed는 immutable(불변)한 개념을 가지기 때문에 따로 setter를 지정할순 없다.
    // 게다가 final 때문에 person1.age = 27; 이런 식으로 값을 바꿀 수 없다.

    // 그래서 무언가 하나만을 수정하고 싶을 때 아래와 같이 .copyWith으로 매우 간편하게 바꿀 수 있다.
    final person3 = person1.copyWith(age: 27);

    return Scaffold(
      appBar: AppBar(
        title: Text('flutter freezed'),
        centerTitle: true,
        elevation: 0.5,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            renderText('person1.id', person1.id.toString()),
            renderText('person1.name', person1.name.toString()),
            renderText('person1.age', person1.age.toString()),
            renderText('toString()', person1.toString()),
            renderText('toJson()', person1.toJson().toString()),
            renderText('==', (person1 == person2).toString()),
            renderText('person3', person3.toJson().toString()),
          ],
        ),
      ),
    );
  }
}
