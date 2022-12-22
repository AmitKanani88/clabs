import 'dart:developer';

import 'package:clabs/app/Bloc/Address/address_bloc.dart';
import 'package:clabs/app/Bloc/Countries/countries_bloc.dart';
import 'package:clabs/app/const/app_colors.dart';
import 'package:country_state_city/models/country.dart';
import 'package:country_state_city/utils/city_utils.dart';
import 'package:country_state_city/utils/country_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPhoneField extends StatefulWidget {
  const CustomPhoneField({
    Key? key,
    required this.title,
    required this.isRequired,
    required this.onSubmit,
    required this.validator,
    required this.onChanged,
  }) : super(key: key);
  final String title;
  final bool isRequired;
  final Function(String) onSubmit;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;

  @override
  State<CustomPhoneField> createState() => _CustomPhoneFieldState();
}

class _CustomPhoneFieldState extends State<CustomPhoneField> {
  late CountriesBloc _countriesBloc;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _countriesBloc = context.read<CountriesBloc>();

    _countriesBloc.add(GetAllPhoneCode());
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
          TextFormField(
            onFieldSubmitted: widget.onSubmit,
            onChanged: widget.onChanged,
            validator: widget.validator,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
            maxLines: 1,
            maxLength: 10,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: InputDecoration(
              filled: true,
              counterText: '',
              hintMaxLines: 1,
              prefixIcon: InkWell(
                onTap: () {
                  _countriesBloc.add(GetAllPhoneCode());

                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      print("object");
                      return BlocConsumer<CountriesBloc, CountriesState>(
                        bloc: _countriesBloc,
                        listener: (context, state) {
                          log(state.toString());
                        },
                        builder: (context, state) {
                          print(" OBJ STATE $state");

                          if (state is PhoneCodeLoading) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (state is PhoneCodeLoaded) {
                            return ListView.builder(
                              itemCount: state.phoneCodes.length,
                              itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListTile(
                                  onTap: () {
                                    if (widget.title.contains("Alter")) {
                                      context.read<AddressBloc>().add(
                                          SelectAlternatePhoneCode(
                                              phoneCode: state.phoneCodes
                                                  .elementAt(index)
                                                  .phoneCode));
                                    } else {
                                      context.read<AddressBloc>().add(
                                          SelectPhoneCode(
                                              phoneCode: state.phoneCodes
                                                  .elementAt(index)
                                                  .phoneCode));
                                    }
                                    Navigator.pop(context);
                                  },
                                  enabled: true,
                                  tileColor: AppColors.textFieldFilledColor,
                                  leading: Text(
                                    state.phoneCodes.elementAt(index).phoneCode,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                  title: Text(
                                    state.phoneCodes
                                        .elementAt(index)
                                        .name
                                        .trim(),
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return Container();
                          }
                        },
                      );
                    },
                  );
                },
                child: Container(
                  width: 70.w,
                  decoration: BoxDecoration(
                    // color: AppColors.textFieldFilledColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: BlocBuilder<AddressBloc, AddressState>(
                        buildWhen: (previous, current) =>
                            previous.phoneCode != current.phoneCode,
                        builder: (context, state) {
                          log(state.phoneCode ?? "111");
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                ((widget.title.contains("Alter"))
                                        ? state.alterPhoneCode
                                        : state.phoneCode) ??
                                    '+91',
                                style: const TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                              const Icon(Icons.arrow_drop_down),
                            ],
                          );
                        }),
                  ),
                ),
              ),
              hintText: "Enter ${widget.title.toLowerCase()}",
              hintStyle: const TextStyle(
                color: AppColors.subtitleTextColor,
                fontWeight: FontWeight.w400,
              ),
              fillColor: AppColors.textFieldFilledColor,
              contentPadding: EdgeInsets.symmetric(horizontal: 14.w),
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.primaryColor,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.primaryColor,
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.textFieldFilledColor,
                ),
              ),
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
