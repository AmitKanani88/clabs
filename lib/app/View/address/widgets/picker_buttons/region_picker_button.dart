import 'package:clabs/app/Bloc/Address/address_bloc.dart';
import 'package:clabs/app/Bloc/Regions/regions_bloc.dart';
import 'package:clabs/app/const/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegionPickerButton extends StatefulWidget {
  const RegionPickerButton({
    Key? key,
  }) : super(key: key);

  @override
  State<RegionPickerButton> createState() => _RegionPickerButtonState();
}

class _RegionPickerButtonState extends State<RegionPickerButton> {
  late RegionsBloc _regionsBloc;
  @override
  void initState() {
    super.initState();
    _regionsBloc = context.read<RegionsBloc>();

    // _countriesBloc.add(GetAllCountries());
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: double.infinity,
      child: InkWell(
        onTap: () {
          if (context.read<AddressBloc>().state.country == null) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please Select Country First")));
            return;
          }
          _regionsBloc.add(GetCountrywiseRegion(countryISOCode: context.read<AddressBloc>().state.country!.isoCode));

          showModalBottomSheet(
            context: context,
            builder: (context) {
              return BlocConsumer<RegionsBloc, RegionsState>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is RegionsLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is RegionsStateLoaded) {
                    if (state.regionsState.regions?.isEmpty ?? true) {
                      return Center(
                        child: Text("No Regions found"),
                      );
                    }
                    return ListView.builder(
                      itemCount: state.regionsState.regions!.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          onTap: () {
                            context.read<AddressBloc>().add(SelectRegion(region: state.regionsState.regions!.elementAt(index)));
                            Navigator.pop(context);
                          },
                          enabled: true,
                          tileColor: AppColors.textFieldFilledColor,
                          leading: Text(
                            state.regionsState.regions!.elementAt(index).isoCode,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          title: Text(
                            state.regionsState.regions!.elementAt(index).name.trim(),
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
              buildWhen: (previous, current) => previous.region?.isoCode != current.region?.isoCode,
              builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      state.region?.name ?? 'Select region',
                      style: TextStyle(
                        fontSize: 12,
                        color: state.region == null ? AppColors.subtitleTextColor : null,
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
