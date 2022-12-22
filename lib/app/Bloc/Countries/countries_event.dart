part of 'countries_bloc.dart';

@immutable
abstract class CountriesEvent {}

class GetAllCountries extends CountriesEvent {}

class GetAllPhoneCode extends CountriesEvent {}

class GetCountrywiseRegion extends CountriesEvent {
  final String countryISOCode;
  GetCountrywiseRegion({required this.countryISOCode});
}

class GetRegionwiseCity extends CountriesEvent {
  final String countryISOCode;
  final String regionISOCode;
  GetRegionwiseCity(
      {required this.countryISOCode, required this.regionISOCode});
}
