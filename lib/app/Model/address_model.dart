import 'package:country_state_city/country_state_city.dart';

class AddressModel {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phoneCode;
  final String? phoneNumber;
  final Country? country;
  final State? region;
  final City? city;
  final String? house;
  final String? address;
  final String? zipCode;
  final String? alterPhoneCode;
  final String? alterPhoneNumber;
  final bool? defaultBilling;
  final bool? defaultShipping;

  AddressModel({
    this.firstName,
    this.lastName,
    this.email,
    this.phoneCode,
    this.phoneNumber,
    this.country,
    this.region,
    this.city,
    this.house,
    this.address,
    this.zipCode,
    this.alterPhoneCode,
    this.alterPhoneNumber,
    this.defaultBilling,
    this.defaultShipping,
  });

  AddressModel.fromJson(Map<String, dynamic> json)
      : firstName = json['firstName'],
        lastName = json['lastName'],
        email = json['email'],
        phoneCode = json['phoneCode'],
        phoneNumber = json['phoneNumber'],
        country = json['country'],
        region = json['region'],
        city = json['city'],
        house = json['house'],
        address = json['address'],
        zipCode = json['zipCode'],
        alterPhoneCode = json['alterPhoneCode'],
        alterPhoneNumber = json['alterPhoneNumber'],
        defaultBilling = json['defaultBilling'],
        defaultShipping = json['defaultShipping'];

  AddressModel copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? phoneCode,
    String? phoneNumber,
    Country? country,
    State? region,
    City? city,
    String? house,
    String? address,
    String? zipCode,
    String? alterPhoneCode,
    String? alterPhoneNumber,
    bool? defaultBilling,
    bool? defaultShipping,
  }) {
    return AddressModel(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        phoneCode: phoneCode ?? this.phoneCode,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        country: country ?? this.country,
        region: region ?? this.region,
        city: city ?? this.city,
        house: house ?? this.house,
        address: address ?? this.address,
        zipCode: zipCode ?? this.zipCode,
        alterPhoneCode: alterPhoneCode ?? this.alterPhoneCode,
        alterPhoneNumber: alterPhoneNumber ?? this.alterPhoneNumber,
        defaultBilling: defaultBilling ?? this.defaultBilling,
        defaultShipping: defaultShipping ?? this.defaultShipping);
  }
}
