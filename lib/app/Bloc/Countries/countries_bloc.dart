import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:country_state_city/models/country.dart';
import 'package:country_state_city/utils/country_utils.dart';
import 'package:country_state_city/utils/utils.dart';
import 'package:meta/meta.dart';

part 'countries_event.dart';
part 'countries_state.dart';

class CountriesBloc extends Bloc<CountriesEvent, CountriesState> {
  CountriesBloc() : super(CountriesInitial()) {
    on<CountriesEvent>((event, emit) async {
      print(event);
      if (event is GetAllCountries) {
        try {
          emit(CountriesLoading());
          final allCountries = await getAllCountries();
          emit(CountriesStateLoaded(state.copyWith(countries: allCountries)));
        } catch (e) {
          log("Error:::::$e");
          emit(CountriesError());
        }
      }
    });
  }
}
