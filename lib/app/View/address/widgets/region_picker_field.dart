import 'package:clabs/app/Model/enums.dart';
import 'package:clabs/app/View/address/widgets/picker_buttons/country_region_city_picker_widget.dart';
import 'package:flutter/material.dart';

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
  @override
  void initState() {
    super.initState();
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
          dropdownPickerType: DropdownPickerType.region,
        )
      ],
    );
  }
}
