part of 'cities_bloc.dart';

@immutable
abstract class CitiesEvent {}

class GetRegionwiseCity extends CitiesEvent {
  final String countryISOCode;
  final String regionISOCode;
  GetRegionwiseCity({required this.countryISOCode, required this.regionISOCode});
}
