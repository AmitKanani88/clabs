import 'package:clabs/app/Bloc/Address/address_bloc.dart';
import 'package:clabs/app/Bloc/Countries/countries_bloc.dart';
import 'package:clabs/app/View/address/widgets/cities_picker_field.dart';
import 'package:clabs/app/View/address/widgets/country_picker_field.dart';
import 'package:clabs/app/View/address/widgets/custom_checkbox_field.dart';
import 'package:clabs/app/View/address/widgets/custom_phone_field.dart';
import 'package:clabs/app/View/address/widgets/custom_text_field.dart';
import 'package:clabs/app/View/address/widgets/region_picker_field.dart';
import 'package:clabs/app/View/profile/widgets/custom_text_field.dart';
import 'package:clabs/app/View/profile/widgets/date_picker_field.dart';
import 'package:clabs/app/const/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfileDetailScreen extends StatefulWidget {
  EditProfileDetailScreen({super.key});

  @override
  State<EditProfileDetailScreen> createState() =>
      _EditProfileDetailScreenState();
}

bool isEmailValid(String email) {
  RegExp regex = new RegExp(
      r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  return regex.hasMatch(email);
}

class _EditProfileDetailScreenState extends State<EditProfileDetailScreen> {
  final formGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.scaffoldBGColor,
        appBar: AppBar(
          shadowColor: const Color.fromRGBO(0, 0, 0, 0.15),
          leadingWidth: 46,
          titleSpacing: 0,
          title: const Text(
            "Edit Profile Information",
            style: TextStyle(
              fontSize: 13,
            ),
          ),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  color: Colors.white,
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
                                  isRequired: false,
                                  onChanged: (val) {},
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
                                  onChanged: (val) {},
                                  isRequired: false,
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
                            isRequired: false,
                            onChanged: (val) {},
                            onSubmit: (value) {
                              formGlobalKey.currentState?.validate();
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty)
                                return "Please Enter valid email";
                              if (value.length < 3) {
                                return "Please Enter Valid email";
                              } else if (!isEmailValid(value)) {
                                return "Please Enter Valid email";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 16.h),
                          DatePickerField(
                            title: 'Date of Birth',
                            isRequired: false,
                            onSubmit: (x) {},
                            validator: (value) {
                              if (value == null || value.length != 10) {
                                return "Please Enter valid PhoneNumber";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 28.h),
                          Container(
                            height: 2,
                            color: AppColors.scaffoldBGColor,
                          ),
                          SizedBox(height: 16.h),
                          CustomPasswordField(
                            title: 'Password',
                            isRequired: false,
                            onChanged: (val) {},
                            onSubmit: (value) {
                              formGlobalKey.currentState?.validate();
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty)
                                return "Please Enter valid email";
                              if (value.length < 3) {
                                return "Please Enter Valid email";
                              } else if (!isEmailValid(value)) {
                                return "Please Enter Valid email";
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
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
                padding: EdgeInsets.only(
                    left: 20.w, right: 20.w, bottom: 20.w, top: 8.w),
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
                      "Save",
                      style: TextStyle(
                        fontSize: 14,
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
