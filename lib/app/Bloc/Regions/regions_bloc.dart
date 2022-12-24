import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:country_state_city/models/state.dart';
import 'package:country_state_city/utils/utils.dart';
import 'package:meta/meta.dart';
part 'regions_event.dart';
part 'regions_state.dart';

class RegionsBloc extends Bloc<RegionsEvent, RegionsState> {
  RegionsBloc() : super(RegionsInitial()) {
    on<RegionsEvent>((event, emit) async {
      print(event);
      if (event is GetCountrywiseRegion) {
        try {
          emit(RegionsLoading());
          final allRigions = await getStatesOfCountry(event.countryISOCode);
          emit(RegionsStateLoaded(state.copyWith(regions: allRigions)));
        } catch (e) {
          log("Error:::::$e");
          emit(RegionsError());
        }
      }
    });
  }
}
