import 'package:clabs/app/Bloc/Address/address_bloc.dart';
import 'package:clabs/app/Bloc/Countries/countries_bloc.dart';
import 'package:clabs/app/View/address/view_all_adress_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 810),
      minTextAdapt: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => CountriesBloc()),
            BlocProvider(create: (_) => AddressBloc()),
          ],
          child: MaterialApp(
            title: 'CLabs',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              textTheme:
                  GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
                      .copyWith(
                bodyText1: GoogleFonts.oswald(
                    textStyle: Theme.of(context).textTheme.bodyText1),
              ),
            ),
            home: child,
          ),
        );
      },
      child: const ViewAllAddress(),
    );
  }
}
