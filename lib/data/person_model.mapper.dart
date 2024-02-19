// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'person_model.dart';

class PersonModelMapper extends ClassMapperBase<PersonModel> {
  PersonModelMapper._();

  static PersonModelMapper? _instance;
  static PersonModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PersonModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'PersonModel';

  static String _$name(PersonModel v) => v.name;
  static const Field<PersonModel, String> _f$name = Field('name', _$name);
  static int? _$age(PersonModel v) => v.age;
  static const Field<PersonModel, int> _f$age = Field('age', _$age, opt: true);

  @override
  final MappableFields<PersonModel> fields = const {
    #name: _f$name,
    #age: _f$age,
  };

  static PersonModel _instantiate(DecodingData data) {
    return PersonModel(data.dec(_f$name), age: data.dec(_f$age));
  }

  @override
  final Function instantiate = _instantiate;

  static PersonModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PersonModel>(map);
  }

  static PersonModel fromJson(String json) {
    return ensureInitialized().decodeJson<PersonModel>(json);
  }
}

mixin PersonModelMappable {
  String toJson() {
    return PersonModelMapper.ensureInitialized()
        .encodeJson<PersonModel>(this as PersonModel);
  }

  Map<String, dynamic> toMap() {
    return PersonModelMapper.ensureInitialized()
        .encodeMap<PersonModel>(this as PersonModel);
  }

  PersonModelCopyWith<PersonModel, PersonModel, PersonModel> get copyWith =>
      _PersonModelCopyWithImpl(this as PersonModel, $identity, $identity);
  @override
  String toString() {
    return PersonModelMapper.ensureInitialized()
        .stringifyValue(this as PersonModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            PersonModelMapper.ensureInitialized()
                .isValueEqual(this as PersonModel, other));
  }

  @override
  int get hashCode {
    return PersonModelMapper.ensureInitialized().hashValue(this as PersonModel);
  }
}

extension PersonModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PersonModel, $Out> {
  PersonModelCopyWith<$R, PersonModel, $Out> get $asPersonModel =>
      $base.as((v, t, t2) => _PersonModelCopyWithImpl(v, t, t2));
}

abstract class PersonModelCopyWith<$R, $In extends PersonModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? name, int? age});
  PersonModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _PersonModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PersonModel, $Out>
    implements PersonModelCopyWith<$R, PersonModel, $Out> {
  _PersonModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PersonModel> $mapper =
      PersonModelMapper.ensureInitialized();
  @override
  $R call({String? name, Object? age = $none}) => $apply(FieldCopyWithData(
      {if (name != null) #name: name, if (age != $none) #age: age}));
  @override
  PersonModel $make(CopyWithData data) =>
      PersonModel(data.get(#name, or: $value.name),
          age: data.get(#age, or: $value.age));

  @override
  PersonModelCopyWith<$R2, PersonModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _PersonModelCopyWithImpl($value, $cast, t);
}
