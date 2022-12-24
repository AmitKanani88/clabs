import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:country_state_city/models/country.dart';
import 'package:country_state_city/utils/country_utils.dart';
import 'package:country_state_city/utils/utils.dart';
import 'package:meta/meta.dart';

part 'phonecodes_event.dart';
part 'phonecodes_state.dart';

class PhoneCodesBloc extends Bloc<PhoneCodesEvent, PhoneCodesState> {
  PhoneCodesBloc() : super(PhoneCodesInitial()) {
    on<PhoneCodesEvent>((event, emit) async {
      print(event);
      if (event is GetAllPhoneCode) {
        try {
          emit(PhoneCodesLoading());
          if (state.phoneCodes?.isEmpty ?? true) {
            final allCountries = await getAllCountries();
            allCountries.removeWhere((e) => e.phoneCode.isEmpty || e.phoneCode.contains('-'));
            emit(PhoneCodesStateLoaded(state.copyWith(phoneCodes: allCountries)));
          } else {
            emit(PhoneCodesStateLoaded(state));
          }
        } catch (e) {
          log("Error:::::$e");
          emit(PhoneCodesError());
        }
      }
    });
  }
}
