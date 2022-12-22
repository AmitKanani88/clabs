import 'package:clabs/app/Bloc/Address/address_bloc.dart';
import 'package:clabs/app/const/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCheckBoxField extends StatelessWidget {
  const CustomCheckBoxField({
    Key? key,
    required this.title,
    required this.isBilling,
    required this.onSubmit,
    required this.validator,
  }) : super(key: key);
  final String title;
  final bool isBilling;
  final Function(String) onSubmit;

  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocBuilder<AddressBloc, AddressState>(
        // buildWhen: (previous, current) =>
        //     previous.country?.isoCode != current.country?.isoCode,
        builder: (context, state) {
          if (isBilling) {
            return InkWell(
              onTap: () {
                context.read<AddressBloc>().add(ChangeDefaultBilling());
              },
              child: Row(
                children: [
                  state.defaultBilling ?? false
                      ? const Icon(Icons.check_box,
                          color: AppColors.primaryColor)
                      : const Icon(Icons.check_box_outline_blank),
                  SizedBox(width: 12.w),
                  Text(title),
                ],
              ),
            );
          } else {
            return InkWell(
              onTap: () {
                context.read<AddressBloc>().add(ChangeDefaultShipping());
              },
              child: Row(
                children: [
                  state.defaultShipping ?? false
                      ? const Icon(
                          Icons.check_box,
                          color: AppColors.primaryColor,
                        )
                      : const Icon(Icons.check_box_outline_blank),
                  SizedBox(width: 12.w),
                  Text(title),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
