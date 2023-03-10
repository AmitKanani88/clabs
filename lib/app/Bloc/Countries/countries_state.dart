part of 'countries_bloc.dart';

@immutable
class CountriesState {
  final List<Country>? countries;

  const CountriesState({this.countries});
  CountriesState.fromJson(Map<String, dynamic> json) : countries = json['countries'];

  CountriesState copyWith({
    List<Country>? countries,
  }) {
    return CountriesState(
      countries: countries ?? this.countries,
    );
  }

  @override
  List<Object?> get props => [
        countries,
      ];
}

class CountriesInitial extends CountriesState {}

class CountriesLoading extends CountriesState {}

class CountriesError extends CountriesState {}

class CountriesStateLoaded extends CountriesState {
  final CountriesState countryState;
  const CountriesStateLoaded(this.countryState);
}

// class CountriesLoaded extends CountriesState {
//   final List<Country> countries;
//   CountriesLoaded(this.countries);
// }

// class CountriesError extends CountriesState {}

// class PhoneCodeLoading extends CountriesState {}

// class PhoneCodeLoaded extends CountriesState {
//   final List<Country> phoneCodes;
//   PhoneCodeLoaded(this.phoneCodes);
// }

// class PhoneCodeError extends CountriesState {}

// class RegionsLoading extends CountriesState {}

// class RegionsLoaded extends CountriesState {
//   final List<State> regionss;
//   RegionsLoaded(this.regionss);
// }

// class RegionsError extends CountriesState {}

// class CitiesLoading extends CountriesState {}

// class CitiesLoaded extends CountriesState {
//   final List<City> citiess;
//   CitiesLoaded(this.citiess);
// }

// class CitiesError extends CountriesState {}
