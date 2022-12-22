import 'package:clabs/app/Bloc/Address/address_bloc.dart';
import 'package:clabs/app/Bloc/Countries/countries_bloc.dart';
import 'package:clabs/app/const/app_colors.dart';
import 'package:country_state_city/models/country.dart';
import 'package:country_state_city/utils/city_utils.dart';
import 'package:country_state_city/utils/country_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class CityPickerField extends StatefulWidget {
  const CityPickerField({
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
  State<CityPickerField> createState() => _CityPickerFieldState();
}

class _CityPickerFieldState extends State<CityPickerField> {
  late CountriesBloc _countriesBloc;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _countriesBloc = context.read<CountriesBloc>();
    return Column(
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
            onTap: () {
              var addressState = context.read<AddressBloc>().state;

              if (addressState.region == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Please Select Region First")));
                return;
              }
              _countriesBloc.add(GetRegionwiseCity(
                  regionISOCode: addressState.region!.isoCode,
                  countryISOCode: addressState.country!.isoCode));

              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return BlocConsumer<CountriesBloc, CountriesState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      if (state is CitiesLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is CitiesLoaded) {
                        if (state.citiess.isEmpty) {
                          return Center(
                            child: Text("No Cities found"),
                          );
                        }
                        return ListView.builder(
                          itemCount: state.citiess.length,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              onTap: () {
                                context.read<AddressBloc>().add(SelectCity(
                                    city: state.citiess.elementAt(index)));
                                Navigator.pop(context);
                              },
                              enabled: true,
                              tileColor: AppColors.textFieldFilledColor,
                              // leading: Text(
                              //   state.citiess.elementAt(index).,
                              //   textAlign: TextAlign.center,
                              //   style: const TextStyle(
                              //     fontSize: 16,
                              //   ),
                              // ),
                              title: Text(
                                state.citiess.elementAt(index).name.trim(),
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
              padding: EdgeInsets.only(left: 14.w),
              decoration: BoxDecoration(
                color: AppColors.textFieldFilledColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: BlocBuilder<AddressBloc, AddressState>(
                  buildWhen: (previous, current) =>
                      previous.city?.name != current.city?.name,
                  builder: (context, state) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          state.city?.name ?? 'Select city',
                          style: TextStyle(
                            fontSize: 12,
                            color: state.city == null
                                ? AppColors.subtitleTextColor
                                : null,
                          ),
                        ),
                        Icon(Icons.arrow_drop_down),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
