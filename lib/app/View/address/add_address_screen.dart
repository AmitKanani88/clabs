import 'package:clabs/app/Bloc/Address/address_bloc.dart';
import 'package:clabs/app/Model/enums.dart';
import 'package:clabs/app/View/address/widgets/cities_picker_field.dart';
import 'package:clabs/app/View/address/widgets/country_picker_field.dart';
import 'package:clabs/app/View/address/widgets/custom_checkbox_field.dart';
import 'package:clabs/app/View/address/widgets/custom_phone_field.dart';
import 'package:clabs/app/View/address/widgets/custom_text_field.dart';
import 'package:clabs/app/View/address/widgets/region_picker_field.dart';
import 'package:clabs/app/View/profile/edit_profile_detail_screen.dart';
import 'package:clabs/app/const/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({super.key});

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

bool isEmailValid(String email) {
  RegExp regex = new RegExp(r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  return regex.hasMatch(email);
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  final formGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          shadowColor: const Color.fromRGBO(0, 0, 0, 0.15),
          leadingWidth: 46,
          titleSpacing: 0,
          title: const Text(
            "Add New Address",
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => EditProfileDetailScreen()));
                },
                icon: const Icon(Icons.person))
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(16.h),
                  child: Form(
                    key: formGlobalKey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: CustomTextField(
                                title: 'First Name',
                                isRequired: true,
                                onChanged: (val) {
                                  context.read<AddressBloc>().add(EditFirstName(str: val));
                                },
                                onSubmit: (value) {},
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please Enter valid Name";
                                  }
                                  if (value.length < 3) {
                                    return "Please Enter Valid Name";
                                  }
                                  return null;
                                },
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Expanded(
                              child: CustomTextField(
                                title: 'Last Name',
                                onChanged: (val) {
                                  context.read<AddressBloc>().add(EditLastName(str: val));
                                },
                                isRequired: true,
                                onSubmit: (value) {},
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please Enter valid Name";
                                  }
                                  if (value.length < 3) {
                                    return "Please Enter Valid Name";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16.h),
                        CustomTextField(
                          title: 'Email',
                          isRequired: true,
                          onChanged: (val) {
                            context.read<AddressBloc>().add(EditEmail(str: val));
                          },
                          onSubmit: (value) {
                            formGlobalKey.currentState?.validate();
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) return "Please Enter valid email";
                            if (value.length < 3) {
                              return "Please Enter Valid email";
                            } else if (!isEmailValid(value)) {
                              return "Please Enter Valid email";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16.h),
                        CustomPhoneField(
                          title: 'Phone Number',
                          dropdownPickerType: DropdownPickerType.phoneCode,
                          isRequired: true,
                          onChanged: (val) {
                            context.read<AddressBloc>().add(EditPhoneNumber(str: val));
                          },
                          onSubmit: (x) {},
                          validator: (value) {
                            if (value == null || value.length != 10) {
                              return "Please Enter valid PhoneNumber";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16.h),
                        CountryPickerField(
                          title: 'Country',
                          isRequired: true,
                          onSubmit: (x) {},
                          validator: (value) {
                            if (value == null || value.length != 10) {
                              return "Please Enter valid PhoneNumber";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16.h),
                        RegionPickerField(
                            title: 'Region',
                            isRequired: true,
                            onSubmit: (x) {},
                            validator: (x) {
                              return null;
                            }),
                        SizedBox(height: 16.h),
                        CityPickerField(
                            title: 'City',
                            isRequired: true,
                            onSubmit: (x) {},
                            validator: (x) {
                              return null;
                            }),
                        SizedBox(height: 16.h),
                        CustomTextField(
                          title: 'House / Plot / Apartment',
                          onChanged: (val) {
                            context.read<AddressBloc>().add(EditHousePlot(str: val));
                          },
                          isRequired: true,
                          onSubmit: (value) {
                            formGlobalKey.currentState?.validate();
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please Enter valid House";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16.h),
                        CustomTextField(
                          title: 'Address',
                          isRequired: true,
                          onChanged: (val) {
                            context.read<AddressBloc>().add(EditAddress(str: val));
                          },
                          onSubmit: (value) {
                            formGlobalKey.currentState?.validate();
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please Enter valid Address";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16.h),
                        CustomTextField(
                          title: 'Zipcode',
                          isRequired: true,
                          onChanged: (val) {
                            context.read<AddressBloc>().add(EditZipCode(str: val));
                          },
                          onSubmit: (value) {
                            formGlobalKey.currentState?.validate();
                          },
                          validator: (value) {
                            print("Zipcode value::: $value");
                            if (value == null || value.length != 6) {
                              return "Please Enter valid zipcode";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16.h),
                        CustomPhoneField(
                          dropdownPickerType: DropdownPickerType.alternatePhoneCode,
                          title: 'Alternate Phone Number',
                          isRequired: false,
                          onChanged: (val) {
                            context.read<AddressBloc>().add(EditAlternatePhoneNumber(str: val));
                          },
                          onSubmit: (x) {},
                          validator: (value) {
                            print("alter value::: ${value?.length} $value");

                            if (value == null || value.length != 10) {
                              return "Please Enter valid PhoneNumber";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16.h),
                        CustomCheckBoxField(
                            title: 'Use as default billing address',
                            isBilling: true,
                            onSubmit: (x) {},
                            validator: (x) {
                              return null;
                            }),
                        SizedBox(height: 16.h),
                        CustomCheckBoxField(
                            title: 'Use as default shipping address',
                            isBilling: false,
                            onSubmit: (x) {},
                            validator: (x) {
                              return null;
                            }),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 1), // changes position of shadow
                  ),
                ],
              ),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.w, top: 8.w),
                child: InkWell(
                  onTap: () {
                    formGlobalKey.currentState?.validate();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: const Center(
                        child: Text(
                      "Add Address",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    )),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
