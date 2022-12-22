import 'package:clabs/app/const/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPasswordField extends StatelessWidget {
  const CustomPasswordField({
    Key? key,
    required this.title,
    required this.isRequired,
    required this.onSubmit,
    required this.validator,
    required this.onChanged,
  }) : super(key: key);
  final String title;
  final bool isRequired;
  final Function(String) onSubmit;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            RichText(
                text: TextSpan(
                    text: title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                  if (isRequired)
                    const TextSpan(
                        text: '* ',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        )),
                ])),
          ],
        ),
        SizedBox(height: 8.h),
        TextFormField(
          onFieldSubmitted: onSubmit,
          validator: validator,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
          onChanged: onChanged,
          maxLines: 1,
          obscureText: true,
          decoration: InputDecoration(
            filled: true,
            hintMaxLines: 1,
            hintText: "Enter ${title.toLowerCase()}",
            errorStyle: const TextStyle(fontSize: 10),
            hintStyle: const TextStyle(
              color: AppColors.subtitleTextColor,
              fontWeight: FontWeight.w400,
            ),
            fillColor: AppColors.textFieldFilledColor,
            contentPadding: EdgeInsets.symmetric(horizontal: 14.w),
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.primaryColor,
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.primaryColor,
              ),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.textFieldFilledColor,
              ),
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red,
              ),
            ),
          ),
        )
      ],
    );
  }
}
