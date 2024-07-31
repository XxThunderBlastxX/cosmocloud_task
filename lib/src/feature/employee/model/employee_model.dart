import 'package:parse_json/parse_json.dart';

import '../../../app/utils/to_json.dart';

final class Employee with ToJson {
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

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'address': address.toJson(),
      'contactMethods': contactMethods.toJson(),
    };
  }
}

final class Address with ToJson {
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

  @override
  Map<String, dynamic> toJson() {
    return {
      'street': street,
      'city': city,
      'country': country,
      'zip': zip,
    };
  }
}

enum ContactMethodType {
  email,
  phone;

  factory ContactMethodType.fromJson(dynamic json) => switch (json) {
        'phone' => ContactMethodType.phone,
        'email' => ContactMethodType.email,
        _ => throw Exception('Unknown enum value')
      };

  String toJson() => switch (this) {
        ContactMethodType.phone => 'phone',
        ContactMethodType.email => 'email',
      };
}

final class ContactMethod with ToJson {
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

  @override
  Map<String, dynamic> toJson() {
    return {
      'contactMethods': contactMethods.toJson(),
      'value': value,
    };
  }
}
