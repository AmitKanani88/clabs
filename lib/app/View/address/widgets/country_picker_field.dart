import 'package:clabs/app/Model/enums.dart';
import 'package:clabs/app/View/address/widgets/picker_buttons/country_region_city_picker_widget.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class CountryPickerField extends StatefulWidget {
  const CountryPickerField({
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
  State<CountryPickerField> createState() => _CountryPickerFieldState();
}

class _CountryPickerFieldState extends State<CountryPickerField> {
  // late CountriesBloc _countriesBloc;
  @override
  void initState() {
    super.initState();
    // _countriesBloc = context.read<CountriesBloc>();

    // _countriesBloc.add(GetAllCountries());
  }

  @override
  Widget build(BuildContext context) {
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
        const CountryRegionCityPickerWidget(
          dropdownPickerType: DropdownPickerType.country,
        ),
        // SizedBox(
        //   height: 48,
        //   width: double.infinity,
        //   child: InkWell(
        //     onTap: () {
        //       _countriesBloc.add(GetAllCountries());

        //       showModalBottomSheet(
        //         context: context,
        //         builder: (context) {
        //           return BlocConsumer<CountriesBloc, CountriesState>(
        //             listener: (context, state) {},
        //             builder: (context, state) {
        //               if (state is CountriesLoading) {
        //                 return const Center(child: CircularProgressIndicator());
        //               } else if (state is CountriesStateLoaded) {
        //                 if (state.countryState.countries?.isEmpty ?? true) {
        //                   return Center(
        //                     child: Text("Plase wait...."),
        //                   );
        //                 }
        //                 return ListView.builder(
        //                   itemCount: state.countryState.countries!.length,
        //                   itemBuilder: (context, index) => Padding(
        //                     padding: const EdgeInsets.all(8.0),
        //                     child: ListTile(
        //                       onTap: () {
        //                         context.read<AddressBloc>().add(SelectCountry(country: state.countryState.countries!.elementAt(index)));
        //                         Navigator.pop(context);
        //                       },
        //                       enabled: true,
        //                       tileColor: AppColors.textFieldFilledColor,
        //                       leading: Text(
        //                         state.countryState.countries!.elementAt(index).flag,
        //                         textAlign: TextAlign.center,
        //                         style: const TextStyle(
        //                           fontSize: 16,
        //                         ),
        //                       ),
        //                       title: Text(
        //                         state.countryState.countries!.elementAt(index).name.trim(),
        //                         textAlign: TextAlign.center,
        //                         style: const TextStyle(
        //                           fontSize: 12,
        //                         ),
        //                       ),
        //                     ),
        //                   ),
        //                 );
        //               } else {
        //                 return Container();
        //               }
        //             },
        //           );
        //         },
        //       );
        //     },
        //     child: Container(
        //       padding: EdgeInsets.only(left: 14.w),
        //       decoration: BoxDecoration(
        //         color: AppColors.textFieldFilledColor,
        //         borderRadius: BorderRadius.circular(5),
        //       ),
        //       child: Center(
        //         child: BlocBuilder<AddressBloc, AddressState>(
        //           buildWhen: (previous, current) => previous.country?.isoCode != current.country?.isoCode,
        //           builder: (context, state) {
        //             return Row(
        //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //               mainAxisSize: MainAxisSize.max,
        //               children: [
        //                 Text(
        //                   state.country?.name ?? 'Select country',
        //                   style: TextStyle(
        //                     fontSize: 12,
        //                     color: state.country == null ? AppColors.subtitleTextColor : null,
        //                   ),
        //                 ),
        //                 Icon(Icons.arrow_drop_down),
        //               ],
        //             );
        //           },
        //         ),
        //       ),
        //     ),
        //   ),
        // )
      ],
    );
  }
}
