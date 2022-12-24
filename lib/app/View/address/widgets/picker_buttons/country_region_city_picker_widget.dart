import 'dart:developer';
import 'dart:io';

import 'package:clabs/app/Bloc/Address/address_bloc.dart';
import 'package:clabs/app/Bloc/PhoneCodes/phonecodes_bloc.dart';
import 'package:clabs/app/Model/enums.dart';
import 'package:clabs/app/View/address/widgets/picker_buttons/cities_picker_button.dart';
import 'package:clabs/app/View/address/widgets/picker_buttons/country_picker_button.dart';
import 'package:clabs/app/View/address/widgets/picker_buttons/phone_code_button.dart';
import 'package:clabs/app/View/address/widgets/picker_buttons/region_picker_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CountryRegionCityPickerWidget extends StatelessWidget {
  const CountryRegionCityPickerWidget({super.key, required this.dropdownPickerType});
  final DropdownPickerType dropdownPickerType;

  @override
  Widget build(BuildContext context) {
    switch (dropdownPickerType) {
      case DropdownPickerType.phoneCode:
      case DropdownPickerType.alternatePhoneCode:
        return PhoneCodeButtonWidget(dropdownPickerType: dropdownPickerType);
      case DropdownPickerType.country:
        return const CountryPickerButton();
      case DropdownPickerType.region:
        return const RegionPickerButton();
      case DropdownPickerType.city:
        return const CityPickerButton();
      case DropdownPickerType.date:
        return Container();
      default:
        return Container();
    }
  }
}
