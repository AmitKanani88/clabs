part of 'address_bloc.dart';

@immutable
abstract class AddressEvent {
  @override
  List<Object> get props => [];
}

// class SelectingCountry extends AddressEvent {}

class SelectPhoneCode extends AddressEvent {
  final String phoneCode;
  SelectPhoneCode({required this.phoneCode});

  @override
  List<String> get props => [
        phoneCode
      ];
}

class ResetData extends AddressEvent {}

class EditFirstName extends AddressEvent {
  final String str;
  EditFirstName({required this.str});

  @override
  List<String> get props => [
        str
      ];
}

class EditLastName extends AddressEvent {
  final String str;
  EditLastName({required this.str});

  @override
  List<String> get props => [
        str
      ];
}

class EditEmail extends AddressEvent {
  final String str;
  EditEmail({required this.str});

  @override
  List<String> get props => [
        str
      ];
}

class EditPhoneNumber extends AddressEvent {
  final String str;
  EditPhoneNumber({required this.str});

  @override
  List<String> get props => [
        str
      ];
}

class EditHousePlot extends AddressEvent {
  final String str;
  EditHousePlot({required this.str});

  @override
  List<String> get props => [
        str
      ];
}

class EditAddress extends AddressEvent {
  final String str;
  EditAddress({required this.str});

  @override
  List<String> get props => [
        str
      ];
}

class EditZipCode extends AddressEvent {
  final String str;
  EditZipCode({required this.str});

  @override
  List<String> get props => [
        str
      ];
}

class EditAlternatePhoneNumber extends AddressEvent {
  final String str;
  EditAlternatePhoneNumber({required this.str});

  @override
  List<String> get props => [
        str
      ];
}

class SelectAlternatePhoneCode extends AddressEvent {
  final String phoneCode;
  SelectAlternatePhoneCode({required this.phoneCode});

  @override
  List<String> get props => [
        phoneCode
      ];
}

class SelectCountry extends AddressEvent {
  final csc.Country country;
  SelectCountry({required this.country});

  @override
  List<csc.Country> get props => [
        country
      ];
}

class SelectRegion extends AddressEvent {
  final csc.State? region;
  SelectRegion({required this.region});

  @override
  List<csc.State> get props => region == null
      ? []
      : [
          region!
        ];
}

class SelectCity extends AddressEvent {
  final csc.City? city;
  SelectCity({required this.city});

  @override
  List<csc.City> get props => city == null
      ? []
      : [
          city!
        ];
}

class ChangeDefaultBilling extends AddressEvent {
  // final csc.City city;
  // SelectCity({required this.city});
  ChangeDefaultBilling();

  @override
  List<csc.City> get props => [];
}

class ChangeDefaultShipping extends AddressEvent {
  // final csc.City city;
  // SelectCity({required this.city});
  ChangeDefaultShipping();

  @override
  List<csc.City> get props => [];
}
