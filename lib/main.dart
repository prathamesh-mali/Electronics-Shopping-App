import 'package:elec_ecom_app/Data/app_data.dart';
import 'package:elec_ecom_app/Constants/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'widget/main_navbar.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: AppColors.creame,
            primary: AppColors.creame,
          ),
          useMaterial3: true,
        ),
        home: const MainNavBar(),
      ),
    );
  }
}
