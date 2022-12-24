part of 'regions_bloc.dart';

@immutable
abstract class RegionsEvent {}

class GetCountrywiseRegion extends RegionsEvent {
  final String countryISOCode;
  GetCountrywiseRegion({required this.countryISOCode});
}
