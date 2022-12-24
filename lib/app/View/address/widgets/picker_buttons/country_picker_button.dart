import 'package:clabs/app/Bloc/Address/address_bloc.dart';
import 'package:clabs/app/Bloc/Countries/countries_bloc.dart';
import 'package:clabs/app/Bloc/Regions/regions_bloc.dart';
import 'package:clabs/app/const/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class CountryPickerButton extends StatefulWidget {
  const CountryPickerButton({
    Key? key,
  }) : super(key: key);

  @override
  State<CountryPickerButton> createState() => _CountryPickerButtonState();
}

class _CountryPickerButtonState extends State<CountryPickerButton> {
  late CountriesBloc _countriesBloc;
  @override
  void initState() {
    super.initState();
    _countriesBloc = context.read<CountriesBloc>();

    _countriesBloc.add(GetAllCountries());
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: double.infinity,
      child: InkWell(
        onTap: () {
          _countriesBloc.add(GetAllCountries());

          showModalBottomSheet(
            context: context,
            builder: (context) {
              return BlocConsumer<CountriesBloc, CountriesState>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is CountriesLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is CountriesStateLoaded) {
                    if (state.countryState.countries?.isEmpty ?? true) {
                      return const Center(
                        child: Text("Plase wait...."),
                      );
                    }
                    return ListView.builder(
                      itemCount: state.countryState.countries!.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          onTap: () {
                            context.read<AddressBloc>().add(SelectCountry(country: state.countryState.countries!.elementAt(index)));
                            context.read<AddressBloc>().add(SelectRegion(region: null));

                            context.read<RegionsBloc>().add(GetCountrywiseRegion(countryISOCode: state.countryState.countries!.elementAt(index).isoCode));
                            Navigator.pop(context);
                          },
                          enabled: true,
                          tileColor: AppColors.textFieldFilledColor,
                          leading: Text(
                            state.countryState.countries!.elementAt(index).flag,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          title: Text(
                            state.countryState.countries!.elementAt(index).name.trim(),
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
              buildWhen: (previous, current) => previous.country?.isoCode != current.country?.isoCode,
              builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      state.country?.name ?? 'Select country',
                      style: TextStyle(
                        fontSize: 12,
                        color: state.country == null ? AppColors.subtitleTextColor : null,
                      ),
                    ),
                    const Icon(Icons.arrow_drop_down),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
