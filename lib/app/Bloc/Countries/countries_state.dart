part of 'countries_bloc.dart';

@immutable
abstract class CountriesState {}

class CountriesInitial extends CountriesState {}

class CountriesLoading extends CountriesState {}

class CountriesLoaded extends CountriesState {
  final List<Country> countries;
  CountriesLoaded(this.countries);
}

class CountriesError extends CountriesState {}

class PhoneCodeLoading extends CountriesState {}

class PhoneCodeLoaded extends CountriesState {
  final List<Country> phoneCodes;
  PhoneCodeLoaded(this.phoneCodes);
}

class PhoneCodeError extends CountriesState {}

class RegionsLoading extends CountriesState {}

class RegionsLoaded extends CountriesState {
  final List<State> regionss;
  RegionsLoaded(this.regionss);
}

class RegionsError extends CountriesState {}

class CitiesLoading extends CountriesState {}

class CitiesLoaded extends CountriesState {
  final List<City> citiess;
  CitiesLoaded(this.citiess);
}

class CitiesError extends CountriesState {}
