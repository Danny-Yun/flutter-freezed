import 'package:freezed_annotation/freezed_annotation.dart';

part 'Person.freezed.dart';

part 'Person.g.dart';

@freezed
class Person with _$Person {
  factory Person({
    int? id,
    String? name,
    int? age,
  }) = _Person;

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);
}
