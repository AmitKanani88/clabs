import 'package:clabs/app/Bloc/Address/address_bloc.dart';
import 'package:clabs/app/View/address/add_address_screen.dart';
import 'package:clabs/app/const/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ViewAllAddress extends StatelessWidget {
  const ViewAllAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBGColor,
      appBar: AppBar(
        shadowColor: const Color.fromRGBO(0, 0, 0, 0.15),
        title: const Text(
          "Address",
          style: TextStyle(
            fontSize: 13,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        actions: [
          InkWell(
            onTap: () {
              context.read<AddressBloc>().add(ResetData());
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => AddAddressScreen()));
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: const [
                  Icon(
                    Icons.add,
                    size: 20,
                    color: AppColors.primaryColor,
                  ),
                  Text(
                    "Add Address",
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.primaryColor,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 5.h),
        itemCount: 2,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
            // height: 120.h,
            // decoration: BoxDecoration(
            //     color: Colors.white, borderRadius: BorderRadius.circular(6.w)),
            child: Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.h),
              elevation: 4,
              shadowColor: Colors.black.withOpacity(0.1),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Mr Ahmed Al Wasl",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      " 91, Al Deemah Street, AAW General Trading",
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: AppColors.subtitleTextColor,
                      ),
                    ),
                    Text(
                      "PO Box 12345",
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: AppColors.subtitleTextColor,
                      ),
                    ),
                    Text(
                      "Dubai, UAE",
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: AppColors.subtitleTextColor,
                      ),
                    ),
                    Text(
                      "Phone: 9716376524",
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: AppColors.subtitleTextColor,
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
