import 'package:freezed_annotation/freezed_annotation.dart';

part 'Person.freezed.dart';

@freezed
class Person with _$Person {
  // Assert 어노테이션을 통해 단정문도 사용 가능
  // @Assert('age.length > 20', '나이는 20살 이상이어야 한다.')
  factory Person({
    required int id,
    required String name,
    required int age,
    int? statusCode,
  }) = _Person;

  factory Person.loading({int? statusCode}) = _Loading;
  factory Person.error(String message, {int? statusCode}) = _Error;

  // flutter pub run build_runner build 터미널에 입력
}
