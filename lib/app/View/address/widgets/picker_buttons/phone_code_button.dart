import 'dart:developer';

import 'package:clabs/app/Bloc/Address/address_bloc.dart';
import 'package:clabs/app/Bloc/PhoneCodes/phonecodes_bloc.dart';
import 'package:clabs/app/Model/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PhoneCodeButtonWidget extends StatefulWidget {
  const PhoneCodeButtonWidget({
    super.key,
    required this.dropdownPickerType,
  });
  final DropdownPickerType dropdownPickerType;

  @override
  State<PhoneCodeButtonWidget> createState() => _PhoneCodeButtonWidgetState();
}

class _PhoneCodeButtonWidgetState extends State<PhoneCodeButtonWidget> {
  late PhoneCodesBloc _phoneCodesBloc;
  List<PopupMenuItem<dynamic>>? phoneItems;
  @override
  void initState() {
    super.initState();
    _phoneCodesBloc = context.read<PhoneCodesBloc>();

    _phoneCodesBloc.add(GetAllPhoneCode());
  }

  @override
  Widget build(BuildContext context) {
    log("isAlterPhoneCode::: ${widget.dropdownPickerType}");
    return BlocConsumer<PhoneCodesBloc, PhoneCodesState>(
      listener: (context, state) {
        log("LISTERNTER::::: ${state}");
        if (state is PhoneCodesStateLoaded) {
          phoneItems = state.phoneCodesState.phoneCodes!
              .map((e) => PopupMenuItem(
                  onTap: () {
                    if (widget.dropdownPickerType == DropdownPickerType.alternatePhoneCode) {
                      context.read<AddressBloc>().add(SelectAlternatePhoneCode(phoneCode: e.phoneCode));
                    } else {
                      context.read<AddressBloc>().add(SelectPhoneCode(phoneCode: e.phoneCode));
                    }
                  },
                  child: Row(
                    children: [
                      Expanded(child: Text("+${e.phoneCode}")),
                      Expanded(child: Text(e.name)),
                    ],
                  )))
              .toList();
        }
      },
      builder: (ctx, state) {
        print(" OBJ STATE $state");
        if (state is PhoneCodesLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is PhoneCodesStateLoaded) {
          if ((state.phoneCodesState.phoneCodes?.isEmpty ?? true) && phoneItems != null) {
            return const Center(
              child: Text("Please waite..."),
            );
          }
          return InkWell(
            onTap: () {
              showMenu(context: context, position: RelativeRect.fill, items: phoneItems!);
            },
            child: Container(
              width: 70.w,
              decoration: BoxDecoration(
                // color: AppColors.textFieldFilledColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: BlocBuilder<AddressBloc, AddressState>(
                    buildWhen: (previous, current) => widget.dropdownPickerType == DropdownPickerType.alternatePhoneCode ? previous.alterPhoneCode != current.alterPhoneCode : previous.phoneCode != current.phoneCode,
                    builder: (context, state) {
                      // log(state.phoneCode ?? "111");
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            (widget.dropdownPickerType == DropdownPickerType.alternatePhoneCode ? state.alterPhoneCode : state.phoneCode) ?? '+91',
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
          );
        } else {
          return Container();
        }
      },
    );
  }
}
