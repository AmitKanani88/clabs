import 'package:clabs/app/Bloc/Address/address_bloc.dart';
import 'package:clabs/app/Bloc/Countries/countries_bloc.dart';
import 'package:clabs/app/const/app_colors.dart';
import 'package:country_state_city/models/country.dart';
import 'package:country_state_city/utils/city_utils.dart';
import 'package:country_state_city/utils/country_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class DatePickerField extends StatefulWidget {
  const DatePickerField({
    Key? key,
    required this.title,
    required this.isRequired,
    required this.onSubmit,
    required this.validator,
  }) : super(key: key);
  final String title;
  final bool isRequired;
  final Function(String) onSubmit;

  final String? Function(String?)? validator;

  @override
  State<DatePickerField> createState() => _DatePickerFieldState();
}

class _DatePickerFieldState extends State<DatePickerField> {
  // late CountriesBloc _countriesBloc;
  @override
  void initState() {
    super.initState();
    // _countriesBloc = context.read<CountriesBloc>();

    // _countriesBloc.add(GetAllCountries());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
              text: TextSpan(
                  text: widget.title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                if (widget.isRequired)
                  const TextSpan(
                      text: '* ',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      )),
              ])),
          SizedBox(height: 8.h),
          SizedBox(
            height: 48,
            width: double.infinity,
            child: InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.only(left: 14.w),
                decoration: BoxDecoration(
                  color: AppColors.textFieldFilledColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Select Date of Birth',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.subtitleTextColor,
                        ),
                      ),
                      Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
