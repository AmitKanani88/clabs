import 'package:clabs/app/Bloc/Address/address_bloc.dart';
import 'package:clabs/app/Bloc/Countries/countries_bloc.dart';
import 'package:clabs/app/const/app_colors.dart';
import 'package:country_state_city/models/country.dart';
import 'package:country_state_city/utils/city_utils.dart';
import 'package:country_state_city/utils/country_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegionPickerField extends StatefulWidget {
  const RegionPickerField({
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
  State<RegionPickerField> createState() => _RegionPickerFieldState();
}

class _RegionPickerFieldState extends State<RegionPickerField> {
  late CountriesBloc _countriesBloc;
  @override
  void initState() {
    super.initState();
    _countriesBloc = context.read<CountriesBloc>();

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
              onTap: () {
                if (context.read<AddressBloc>().state.country == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Please Select Country First")));
                  return;
                }
                _countriesBloc.add(GetCountrywiseRegion(
                    countryISOCode:
                        context.read<AddressBloc>().state.country!.isoCode));

                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return BlocConsumer<CountriesBloc, CountriesState>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        if (state is RegionsLoading) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (state is RegionsLoaded) {
                          if (state.regionss.isEmpty) {
                            return Center(
                              child: Text("No Regions found"),
                            );
                          }
                          return ListView.builder(
                            itemCount: state.regionss.length,
                            itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                onTap: () {
                                  context.read<AddressBloc>().add(SelectRegion(
                                      region: state.regionss.elementAt(index)));
                                  Navigator.pop(context);
                                },
                                enabled: true,
                                tileColor: AppColors.textFieldFilledColor,
                                leading: Text(
                                  state.regionss.elementAt(index).isoCode,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                title: Text(
                                  state.regionss.elementAt(index).name.trim(),
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
                        previous.region?.isoCode != current.region?.isoCode,
                    builder: (context, state) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            state.region?.name ?? 'Select region',
                            style: TextStyle(
                              fontSize: 12,
                              color: state.region == null
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
      ),
    );
  }
}
