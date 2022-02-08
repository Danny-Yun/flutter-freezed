import 'package:freezed_annotation/freezed_annotation.dart';

part 'Person.freezed.dart';

@freezed
class Person with _$Person {
  // Assert 어노테이션을 통해 단정문도 사용 가능
  // @Assert('age.length > 20', '나이는 20살 이상이어야 한다.')
  factory Person({
    int? id,
    String? name,
    int? age,
    Group? group,
  }) = _Person;

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);
}

@freezed
class Group with _$Group {
  factory Group({
    int? id,
    String? name,
    School? school,
  }) = _Group;
}

@freezed
class School with _$School {
  factory School({
    int? id,
    String? name,
  }) = _School;
}
