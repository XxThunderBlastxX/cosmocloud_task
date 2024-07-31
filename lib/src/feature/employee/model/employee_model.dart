import 'package:json_annotation/json_annotation.dart';

part 'employee_model.g.dart';

@JsonSerializable()
final class Employee {
  @JsonKey(name: '_id', includeFromJson: true, includeToJson: false)
  final String? id;

  final String name;

  final Address address;

  final ContactMethod contactMethods;

  const Employee({
    this.id,
    required this.name,
    required this.address,
    required this.contactMethods,
  });

  factory Employee.fromJson(Map<String, dynamic> json) =>
      _$EmployeeFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeToJson(this);
}

@JsonSerializable()
final class Address {
  final String line1;

  final String city;

  final String country;

  final String zipCode;

  const Address({
    required this.line1,
    required this.city,
    required this.country,
    required this.zipCode,
  });

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}

@JsonEnum()
enum ContactMethodType {
  email,
  phone;
}

@JsonSerializable()
final class ContactMethod {
  final ContactMethodType contactMethod;
  final String value;

  const ContactMethod({
    required this.contactMethod,
    required this.value,
  });

  factory ContactMethod.fromJson(Map<String, dynamic> json) =>
      _$ContactMethodFromJson(json);

  Map<String, dynamic> toJson() => _$ContactMethodToJson(this);
}
