part of 'cities_bloc.dart';

@immutable
class CitiesState {
  final List<City>? cities;

  const CitiesState({this.cities});
  CitiesState.fromJson(Map<String, dynamic> json) : cities = json['cities'];

  CitiesState copyWith({
    List<City>? cities,
  }) {
    return CitiesState(
      cities: cities ?? this.cities,
    );
  }

  @override
  List<Object?> get props => [
        cities
      ];
}

class CitiesInitial extends CitiesState {}

class CitiesLoading extends CitiesState {}

class CitiesError extends CitiesState {}

class CitiesStateLoaded extends CitiesState {
  final CitiesState citiesState;
  const CitiesStateLoaded(this.citiesState);
}
