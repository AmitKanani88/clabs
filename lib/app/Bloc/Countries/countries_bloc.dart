import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:country_state_city/models/city.dart';
import 'package:country_state_city/models/country.dart';
import 'package:country_state_city/models/state.dart';
import 'package:country_state_city/utils/country_utils.dart';
import 'package:country_state_city/utils/utils.dart';
import 'package:meta/meta.dart';

part 'countries_event.dart';
part 'countries_state.dart';

class CountriesBloc extends Bloc<CountriesEvent, CountriesState> {
  CountriesBloc() : super(CountriesInitial()) {
    on<CountriesEvent>((event, emit) async {
      print(event);
      if (event is GetAllPhoneCode) {
        try {
          emit(PhoneCodeLoading());
          final allCountries = await getAllCountries();
          allCountries.removeWhere(
              (e) => e.phoneCode.isEmpty || e.phoneCode.contains('-'));
          emit(PhoneCodeLoaded(allCountries));
        } catch (e) {
          log("Error:::::$e");
          emit(PhoneCodeError());
        }
      } else if (event is GetAllCountries) {
        try {
          emit(CountriesLoading());
          final allCountries = await getAllCountries();
          emit(CountriesLoaded(allCountries));
        } catch (e) {
          log("Error:::::$e");
          emit(CountriesError());
        }
      } else if (event is GetCountrywiseRegion) {
        try {
          emit(RegionsLoading());
          final allCountries = await getStatesOfCountry(event.countryISOCode);
          emit(RegionsLoaded(allCountries));
        } catch (e) {
          log("Error:::::$e");
          emit(RegionsError());
        }
      } else if (event is GetRegionwiseCity) {
        try {
          emit(CitiesLoading());
          final cities =
              await getStateCities(event.countryISOCode, event.regionISOCode);
          emit(CitiesLoaded(cities));
        } catch (e) {
          log("Error:::::$e");
          emit(CitiesError());
        }
      }
    });
  }
}
