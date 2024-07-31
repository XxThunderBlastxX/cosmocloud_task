import 'package:parse_json/parse_json.dart';

final class Employee {
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

  factory Employee.fromJson(dynamic json) => parse(Employee.new, json, {
        "id": string.optional,
        "name": string,
        "address": Address.fromJson.required,
        "contactMethods": ContactMethod.fromJson.required,
      });
}

final class Address {
  final String street;
  final String city;
  final String country;
  final String zip;

  const Address({
    required this.street,
    required this.city,
    required this.country,
    required this.zip,
  });

  factory Address.fromJson(dynamic json) => parse(Address.new, json, {
        "street": string,
        "city": string,
        "country": string,
        "zip": string,
      });
}

enum ContactMethodType {
  email,
  phone;

  factory ContactMethodType.fromJson(dynamic json) => switch (json) {
        'phone' => ContactMethodType.phone,
        'email' => ContactMethodType.email,
        _ => throw Exception('Unknown enum value')
      };
}

final class ContactMethod {
  final ContactMethodType contactMethods;
  final String value;

  const ContactMethod({
    required this.contactMethods,
    required this.value,
  });

  factory ContactMethod.fromJson(dynamic json) =>
      parse(ContactMethod.new, json, {
        "contactMethods": ContactMethodType.fromJson.required,
        "value": string,
      });
}
