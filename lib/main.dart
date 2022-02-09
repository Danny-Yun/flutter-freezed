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
            // Flexible로 화면 넘어가는 문제 자연스럽게 줄 넘김 되도록
            Flexible(
              child: Text(
                title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
        Row(
          children: [
            Flexible(
              child: Text(
                text,
                style: TextStyle(fontSize: 17),
              ),
            )
          ],
        ),
        Divider(),
      ],
    );
  }

  mapWhen(Person person) {
    return person.when(
      (id, name, age, statusCode) =>
          'id: $id, name: $name, age: $age, statusCode: $statusCode',
      loading: (int? statusCode) => 'now loading...',
      error: (String message, int? statusCode) => message,
    );
  }

  @override
  Widget build(BuildContext context) {
    // final school1 = School(id: 1, name: "Duke");
    // final group1 = Group(id: 1, name: "Software Engineer", school: school1);

    // final person1 = Person(id: 1, name: 'riudiu', age: 22, group: group1);
    // final person2 = Person(id: 1, name: 'riudiu', age: 22, group: group1);

    // freezed는 immutable(불변)한 개념을 가지기 때문에 따로 setter를 지정할순 없다.
    // 게다가 final 때문에 person1.age = 27; 이런 식으로 값을 바꿀 수 없다.

    // 그래서 무언가 하나만을 수정하고 싶을 때 아래와 같이 .copyWith으로 매우 간편하게 바꿀 수 있다.
    // final person3 = person1.copyWith(age: 27);
    // // 아래는 더 딥하게 들어가는 copyWith으로 특히 캐시 관리나 프로퍼티 변경 때 유용하게 사용할 수 있다.
    // final person4 = person1.copyWith.group.school(name: "Yale");

    final person =
        Person(id: 11, name: 'Gareth Bale', age: 24, statusCode: 200);
    final personLoading = Person.loading();
    final personError = Person.error('accessToken이 잘못됐습니다', statusCode: 401);

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
            renderText('person', person.toString()),
            renderText('personLoading', personLoading.toString()),
            renderText('personError', personError.toString()),
            // Person에서 공통된 프로퍼티가 statusCode밖에 없다
            renderText('person.statusCode', person.statusCode.toString()),
            renderText('person.when', mapWhen(person)),
            renderText('personLoding.when', mapWhen(personLoading)),
            renderText('personLoding.error', mapWhen(personError)),

            // renderText('person1.id', person1.id.toString()),
            // renderText('person1.name', person1.name.toString()),
            // renderText('person1.age', person1.age.toString()),
            // renderText('person1.age', person1.group.toString()),
            // renderText('toString()', person1.toString()),
            // renderText('toJson()', person1.toJson().toString()),
            // renderText('==', (person1 == person2).toString()),
            // renderText('person3', person3.toJson().toString()),
          ],
        ),
      ),
    );
  }
}
