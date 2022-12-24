import 'package:bloc/bloc.dart';
import 'package:clabs/app/Bloc/Address/address_bloc.dart';
import 'package:country_state_city/country_state_city.dart' as csc;
import 'package:meta/meta.dart';

import 'package:flutter/material.dart';
part 'address_event.dart';
part 'address_state.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  AddressBloc() : super(AddressInitial()) {
    on<AddressEvent>((event, emit) {
      print(event);
      print("SelectPhoneCode $event ${event is SelectPhoneCode}");
      if (event is ResetData) {
        emit(AddressState());
      } else if (event is EditFirstName) {
        emit(state.copyWith(
          firstName: event.props.first,
        ));
      } else if (event is EditLastName) {
        emit(state.copyWith(
          lastName: event.props.first,
        ));
      } else if (event is EditEmail) {
        emit(state.copyWith(
          email: event.props.first,
        ));
      } else if (event is EditPhoneNumber) {
        emit(state.copyWith(
          phoneNumber: event.props.first,
        ));
      } else if (event is EditHousePlot) {
        emit(state.copyWith(
          house: event.props.first,
        ));
      } else if (event is EditAddress) {
        emit(state.copyWith(
          address: event.props.first,
        ));
      } else if (event is EditZipCode) {
        emit(state.copyWith(
          zipCode: event.props.first,
        ));
      } else if (event is EditAlternatePhoneNumber) {
        emit(state.copyWith(
          alterPhoneNumber: event.props.first,
        ));
      } else if (event is SelectCountry) {
        emit(state.copyWith(
          country: event.props.first,
        ));
      } else if (event is SelectRegion) {
        emit(state.copyWith(
          region: event.props.isEmpty ? null : event.props.first,
        ));
      } else if (event is SelectCity) {
        emit(state.copyWith(
          city: event.props.isEmpty ? null : event.props.first,
        ));
      } else if (event is SelectPhoneCode) {
        print(event.props);
        String phoneCode = event.props.first;
        if (!phoneCode.contains('+')) {
          phoneCode = '+$phoneCode';
        }

        emit(state.copyWith(
          phoneCode: phoneCode,
        ));
      } else if (event is SelectAlternatePhoneCode) {
        print(event.props);
        String phoneCode = event.props.first;
        if (!phoneCode.contains('+')) {
          phoneCode = '+$phoneCode';
        }

        emit(state.copyWith(
          alterPhoneCode: phoneCode,
        ));
      } else if (event is ChangeDefaultBilling) {
        emit(state.copyWith(
          defaultBilling: !(state.defaultBilling ?? false),
        ));
      } else if (event is ChangeDefaultShipping) {
        emit(state.copyWith(
          defaultShipping: !(state.defaultShipping ?? false),
        ));
      }
    });
  }
}
