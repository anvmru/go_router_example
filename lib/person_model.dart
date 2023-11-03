import 'package:dart_mappable/dart_mappable.dart';

part 'person_model.mapper.dart';

@MappableClass()
class PersonModel with PersonModelMappable {
  PersonModel(this.name, {this.age});

  final String name;
  final int? age;
}
