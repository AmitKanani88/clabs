import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:country_state_city/models/city.dart';
import 'package:country_state_city/utils/utils.dart';
import 'package:meta/meta.dart';

part 'cities_event.dart';
part 'cities_state.dart';

class CitiesBloc extends Bloc<CitiesEvent, CitiesState> {
  CitiesBloc() : super(CitiesInitial()) {
    on<CitiesEvent>((event, emit) async {
      print(event);
      if (event is GetRegionwiseCity) {
        try {
          emit(CitiesLoading());
          final cities = await getStateCities(event.countryISOCode, event.regionISOCode);
          emit(CitiesStateLoaded(state.copyWith(cities: cities)));
        } catch (e) {
          log("Error:::::$e");
          emit(CitiesError());
        }
      }
    });
  }
}
