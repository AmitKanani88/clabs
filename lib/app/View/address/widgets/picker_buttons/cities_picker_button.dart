import 'package:clabs/app/Bloc/Address/address_bloc.dart';
import 'package:clabs/app/Bloc/Cities/cities_bloc.dart';
import 'package:clabs/app/const/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class CityPickerButton extends StatefulWidget {
  const CityPickerButton({
    Key? key,
  }) : super(key: key);
  @override
  State<CityPickerButton> createState() => _CityPickerButtonState();
}

class _CityPickerButtonState extends State<CityPickerButton> {
  late CitiesBloc _citiesBloc;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: double.infinity,
      child: InkWell(
        onTap: () {
          var addressState = context.read<AddressBloc>().state;
          // _countriesBloc = context.read<CountriesBloc>();

          _citiesBloc = context.read<CitiesBloc>();

          if (addressState.region == null) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please Select Region First")));
            return;
          }
          _citiesBloc.add(GetRegionwiseCity(regionISOCode: addressState.region!.isoCode, countryISOCode: addressState.country!.isoCode));

          showModalBottomSheet(
            context: context,
            builder: (context) {
              return BlocConsumer<CitiesBloc, CitiesState>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is CitiesLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is CitiesStateLoaded) {
                    if (state.citiesState.cities?.isEmpty ?? true) {
                      return Center(
                        child: Text("No Cities found"),
                      );
                    }
                    return ListView.builder(
                      itemCount: state.citiesState.cities!.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          onTap: () {
                            context.read<AddressBloc>().add(SelectCity(city: state.citiesState.cities!.elementAt(index)));
                            Navigator.pop(context);
                          },
                          enabled: true,
                          tileColor: AppColors.textFieldFilledColor,
                          // leading: Text(
                          //   state.citiesState.cities?.elementAt(index).,
                          //   textAlign: TextAlign.center,
                          //   style: const TextStyle(
                          //     fontSize: 16,
                          //   ),
                          // ),
                          title: Text(
                            state.citiesState.cities!.elementAt(index).name.trim(),
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
              buildWhen: (previous, current) => previous.city?.name != current.city?.name,
              builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      state.city?.name ?? 'Select city',
                      style: TextStyle(
                        fontSize: 12,
                        color: state.city == null ? AppColors.subtitleTextColor : null,
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
    );
  }
}
