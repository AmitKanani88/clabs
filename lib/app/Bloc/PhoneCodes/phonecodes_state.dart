part of 'phonecodes_bloc.dart';

@immutable
class PhoneCodesState {
  final List<Country>? phoneCodes;

  const PhoneCodesState({
    this.phoneCodes,
  });
  PhoneCodesState.fromJson(Map<String, dynamic> json) : phoneCodes = json['phoneCodes'];

  PhoneCodesState copyWith({
    List<Country>? phoneCodes,
  }) {
    return PhoneCodesState(
      phoneCodes: phoneCodes ?? this.phoneCodes,
    );
  }

  @override
  List<Object?> get props => [
        phoneCodes
      ];
}

class PhoneCodesInitial extends PhoneCodesState {}

class PhoneCodesLoading extends PhoneCodesState {}

class PhoneCodesError extends PhoneCodesState {}

class PhoneCodesStateLoaded extends PhoneCodesState {
  final PhoneCodesState phoneCodesState;
  const PhoneCodesStateLoaded(this.phoneCodesState);
}

// class PhoneCodesLoaded extends CountriesState {
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
