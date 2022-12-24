part of 'phonecodes_bloc.dart';

@immutable
abstract class PhoneCodesEvent {}

// class GetAllCountries extends PhoneCodesEvent {}

class GetAllPhoneCode extends PhoneCodesEvent {}

// class GetCountrywiseRegion extends CountriesEvent {
//   final String countryISOCode;
//   GetCountrywiseRegion({required this.countryISOCode});
// }

// class GetRegionwiseCity extends CountriesEvent {
//   final String countryISOCode;
//   final String regionISOCode;
//   GetRegionwiseCity(
//       {required this.countryISOCode, required this.regionISOCode});
// }
