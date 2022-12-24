import 'package:clabs/app/Model/enums.dart';
import 'package:clabs/app/View/address/widgets/picker_buttons/country_region_city_picker_widget.dart';
import 'package:clabs/app/View/address/widgets/picker_buttons/phone_code_button.dart';
import 'package:clabs/app/const/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPhoneField extends StatefulWidget {
  const CustomPhoneField({
    Key? key,
    required this.title,
    required this.isRequired,
    required this.onSubmit,
    required this.validator,
    required this.onChanged,
    required this.dropdownPickerType,
  }) : super(key: key);
  final String title;
  final bool isRequired;
  final Function(String) onSubmit;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final DropdownPickerType dropdownPickerType;

  @override
  State<CustomPhoneField> createState() => _CustomPhoneFieldState();
}

class _CustomPhoneFieldState extends State<CustomPhoneField> {
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
        TextFormField(
          onFieldSubmitted: widget.onSubmit,
          onChanged: widget.onChanged,
          validator: widget.validator,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
          maxLines: 1,
          maxLength: 10,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly
          ],
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            filled: true,
            counterText: '',
            hintMaxLines: 1,
            prefixIcon: CountryRegionCityPickerWidget(
              key: Key(widget.title),
              dropdownPickerType: widget.dropdownPickerType,
            ),
            hintText: "Enter ${widget.title.toLowerCase()}",
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

// InkWell(
//               onTap: () {
//                 _countriesBloc.add(GetAllPhoneCode());
                
//                 // showModalBottomSheet(
//                 //   context: context,
//                 //   builder: (context) {
//                 //     print("object");
//                 //     return BlocConsumer<CountriesBloc, CountriesState>(
//                 //       bloc: _countriesBloc,
//                 //       listener: (context, state) {
//                 //         log(state.toString());
//                 //       },
//                 //       builder: (context, state) {
//                 //         print(" OBJ STATE $state");
//                 //         if (state is PhoneCodeLoading) {
//                 //           return const Center(child: CircularProgressIndicator());
//                 //         } else if (state is PhoneCodeLoaded) {
//                 //           return ListView.builder(
//                 //             itemCount: state.phoneCodes.length,
//                 //             itemBuilder: (context, index) => Padding(
//                 //               padding: const EdgeInsets.all(8.0),
//                 //               child: ListTile(
//                 //                 onTap: () {
//                 //                   if (widget.title.contains("Alter")) {
//                 //                     context.read<AddressBloc>().add(SelectAlternatePhoneCode(phoneCode: state.phoneCodes.elementAt(index).phoneCode));
//                 //                   } else {
//                 //                     context.read<AddressBloc>().add(SelectPhoneCode(phoneCode: state.phoneCodes.elementAt(index).phoneCode));
//                 //                   }
//                 //                   Navigator.pop(context);
//                 //                 },
//                 //                 enabled: true,
//                 //                 tileColor: AppColors.textFieldFilledColor,
//                 //                 leading: Text(
//                 //                   state.phoneCodes.elementAt(index).phoneCode,
//                 //                   textAlign: TextAlign.center,
//                 //                   style: const TextStyle(
//                 //                     fontSize: 12,
//                 //                   ),
//                 //                 ),
//                 //                 title: Text(
//                 //                   state.phoneCodes.elementAt(index).name.trim(),
//                 //                   textAlign: TextAlign.center,
//                 //                   style: const TextStyle(
//                 //                     fontSize: 12,
//                 //                   ),
//                 //                 ),
//                 //               ),
//                 //             ),
//                 //           );
//                 //         } else {
//                 //           return Container();
//                 //         }
//                 //       },
//                 //     );
//                 //   },
//                 // );
             
//               },
//               child: Container(
//                 width: 70.w,
//                 decoration: BoxDecoration(
//                   // color: AppColors.textFieldFilledColor,
//                   borderRadius: BorderRadius.circular(5),
//                 ),
//                 child: Center(
//                   child: BlocBuilder<AddressBloc, AddressState>(
//                       buildWhen: (previous, current) => previous.phoneCode != current.phoneCode,
//                       builder: (context, state) {
//                         log(state.phoneCode ?? "111");
//                         return Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             Text(
//                               ((widget.title.contains("Alter")) ? state.alterPhoneCode : state.phoneCode) ?? '+91',
//                               style: const TextStyle(
//                                 fontSize: 12,
//                               ),
//                             ),
//                             const Icon(Icons.arrow_drop_down),
//                           ],
//                         );
//                       }),
//                 ),
//               ),
//             )



//--------

// BlocConsumer<CountriesBloc, CountriesState>(
//               // bloc: _countriesBloc,

//               listener: (context, state) {
//                 log(state.toString());
//               },
//               builder: (context, state) {
//                 print(" OBJ STATE $state");
//                 if (state is PhoneCodeLoading) {
//                   return const Center(child: CircularProgressIndicator());
//                 } else if (state is PhoneCodeLoaded) {
//                   return BlocConsumer<AddressBloc, AddressState>(
//                       key: Key(widget.title),
//                       listener: (context, state) {},
//                       buildWhen: (previous, current) => widget.title.contains("Alter") ? previous.alterPhoneCode != current.alterPhoneCode : previous.phoneCode != current.phoneCode,
//                       builder: (context, AddressState addressState) {
//                         print("object");
//                         return Theme(
//                           key: Key(widget.title),
//                           data: Theme.of(context).copyWith(
//                               // canvasColor: Colors.blue.shade200,
//                               ),
//                           child: DropdownButton(
//                             key: Key(widget.title),
//                             value: '+91',
//                             hint: const Text(
//                               ' +91',
//                               style: TextStyle(fontSize: 15),
//                             ),
//                             underline: const SizedBox(),
//                             items: List<DropdownMenuItem<String>>.generate(
//                                 state.phoneCodes.length,
//                                 (index) => DropdownMenuItem(
//                                     onTap: () {
//                                       if (widget.title.contains("Alter")) {
//                                         context.read<AddressBloc>().add(SelectAlternatePhoneCode(phoneCode: state.phoneCodes.elementAt(index).phoneCode));
//                                       } else {
//                                         context.read<AddressBloc>().add(SelectPhoneCode(phoneCode: state.phoneCodes.elementAt(index).phoneCode));
//                                       }
//                                     },
//                                     value: "+${state.phoneCodes.elementAt(index).phoneCode}",
//                                     child: Padding(
//                                       padding: const EdgeInsets.all(8.0),
//                                       child: Text(
//                                         state.phoneCodes.elementAt(index).phoneCode,
//                                         textAlign: TextAlign.center,
//                                         style: const TextStyle(
//                                           fontSize: 12,
//                                         ),
//                                       ),
//                                     ))),
//                             onChanged: (value) {
//                               // _value = value;
//                             },
//                           ),
//                         );
//                       });
//                   return PopupMenuButton(
//                     position: PopupMenuPosition.under,
//                     child: Container(
//                       width: 70.w,
//                       decoration: BoxDecoration(
//                         // color: AppColors.textFieldFilledColor,
//                         borderRadius: BorderRadius.circular(5),
//                       ),
//                       child: Center(
//                         child: BlocBuilder<AddressBloc, AddressState>(
//                             buildWhen: (previous, current) => previous.phoneCode != current.phoneCode,
//                             builder: (context, state) {
//                               log(state.phoneCode ?? "111");
//                               return Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                 children: [
//                                   Text(
//                                     ((widget.title.contains("Alter")) ? state.alterPhoneCode : state.phoneCode) ?? '+91',
//                                     style: const TextStyle(
//                                       fontSize: 12,
//                                     ),
//                                   ),
//                                   const Icon(Icons.arrow_drop_down),
//                                 ],
//                               );
//                             }),
//                       ),
//                     ),
//                     onSelected: (value) {},
//                     itemBuilder: (context) {
//                       return List.generate(
//                           state.phoneCodes.length,
//                           (index) => PopupMenuItem(
//                               value: state.phoneCodes.elementAt(index).phoneCode,
//                               child: Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Row(
//                                   children: [
//                                     Text(
//                                       state.phoneCodes.elementAt(index).phoneCode,
//                                       textAlign: TextAlign.center,
//                                       style: const TextStyle(
//                                         fontSize: 12,
//                                       ),
//                                     ),
//                                     Text(
//                                       state.phoneCodes.elementAt(index).name.trim(),
//                                       textAlign: TextAlign.center,
//                                       style: const TextStyle(
//                                         fontSize: 12,
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                                 // child: ListTile(
//                                 //   onTap: () {
//                                 //     if (widget.title.contains("Alter")) {
//                                 //       context.read<AddressBloc>().add(SelectAlternatePhoneCode(phoneCode: state.phoneCodes.elementAt(index).phoneCode));
//                                 //     } else {
//                                 //       context.read<AddressBloc>().add(SelectPhoneCode(phoneCode: state.phoneCodes.elementAt(index).phoneCode));
//                                 //     }
//                                 //     Navigator.pop(context);
//                                 //   },
//                                 //   enabled: true,
//                                 //   tileColor: AppColors.textFieldFilledColor,
//                                 //   leading: Text(
//                                 //     state.phoneCodes.elementAt(index).phoneCode,
//                                 //     textAlign: TextAlign.center,
//                                 //     style: const TextStyle(
//                                 //       fontSize: 12,
//                                 //     ),
//                                 //   ),
//                                 //   title: Text(
//                                 //     state.phoneCodes.elementAt(index).name.trim(),
//                                 //     textAlign: TextAlign.center,
//                                 //     style: const TextStyle(
//                                 //       fontSize: 12,
//                                 //     ),
//                                 //   ),
//                                 // ),
//                               )));
//                       // return ListView.builder(
//                       //   itemCount: state.phoneCodes.length,
//                       //   itemBuilder: (context, index) => Padding(
//                       //     padding: const EdgeInsets.all(8.0),
//                       //     child: ListTile(
//                       //       onTap: () {
//                       //         if (widget.title.contains("Alter")) {
//                       //           context.read<AddressBloc>().add(SelectAlternatePhoneCode(phoneCode: state.phoneCodes.elementAt(index).phoneCode));
//                       //         } else {
//                       //           context.read<AddressBloc>().add(SelectPhoneCode(phoneCode: state.phoneCodes.elementAt(index).phoneCode));
//                       //         }
//                       //         Navigator.pop(context);
//                       //       },
//                       //       enabled: true,
//                       //       tileColor: AppColors.textFieldFilledColor,
//                       //       leading: Text(
//                       //         state.phoneCodes.elementAt(index).phoneCode,
//                       //         textAlign: TextAlign.center,
//                       //         style: const TextStyle(
//                       //           fontSize: 12,
//                       //         ),
//                       //       ),
//                       //       title: Text(
//                       //         state.phoneCodes.elementAt(index).name.trim(),
//                       //         textAlign: TextAlign.center,
//                       //         style: const TextStyle(
//                       //           fontSize: 12,
//                       //         ),
//                       //       ),
//                       //     ),
//                       //   ),
//                       // );
//                     },
//                   );
//                   // // return ListView.builder(
//                   //   itemCount: state.phoneCodes.length,
//                   //   itemBuilder: (context, index) => Padding(
//                   //     padding: const EdgeInsets.all(8.0),
//                   //     child: ListTile(
//                   //       onTap: () {
//                   //         if (widget.title.contains("Alter")) {
//                   //           context.read<AddressBloc>().add(SelectAlternatePhoneCode(phoneCode: state.phoneCodes.elementAt(index).phoneCode));
//                   //         } else {
//                   //           context.read<AddressBloc>().add(SelectPhoneCode(phoneCode: state.phoneCodes.elementAt(index).phoneCode));
//                   //         }
//                   //         Navigator.pop(context);
//                   //       },
//                   //       enabled: true,
//                   //       tileColor: AppColors.textFieldFilledColor,
//                   //       leading: Text(
//                   //         state.phoneCodes.elementAt(index).phoneCode,
//                   //         textAlign: TextAlign.center,
//                   //         style: const TextStyle(
//                   //           fontSize: 12,
//                   //         ),
//                   //       ),
//                   //       title: Text(
//                   //         state.phoneCodes.elementAt(index).name.trim(),
//                   //         textAlign: TextAlign.center,
//                   //         style: const TextStyle(
//                   //           fontSize: 12,
//                   //         ),
//                   //       ),
//                   //     ),
//                   //   ),
//                   // );

//                 } else {
//                   return Container();
//                 }
//               },
//             ),
           