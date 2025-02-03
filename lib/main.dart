import 'package:codeedex_task/bloc/product_cubit/product_cubit.dart';
import 'package:codeedex_task/bloc/product_detail_cubit/product_dtl_cubit.dart';
import 'package:codeedex_task/screen/login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'data/shared.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Shared().loadPref();
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => ProductCubit(),
    ),
    BlocProvider(
      create: (context) => ProductDtlCubit(),
    ),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, type) {
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const LoginScreen(),
        );
      },
    );
  }
}
