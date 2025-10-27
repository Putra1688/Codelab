import 'package:flutter/material.dart';
import './views/plan_screen.dart';
import './models/plan.dart';
import './provider/plan_provider.dart';

void main() => runApp(MasterPlanApp());

class MasterPlanApp extends StatelessWidget {
  const MasterPlanApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   theme: ThemeData(
    //     colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple),
    //     appBarTheme: const AppBarTheme(
    //       backgroundColor: Colors.purple, // warna header
    //       foregroundColor: Colors.white, // warna teks di AppBar
    //     ),
    //   ),
    //   home: PlanScreen(),
    // );
    return MaterialApp(
      theme: ThemeData(
      colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.purple, // warna header
          foregroundColor: Colors.white, // warna teks di AppBar
        ),
      ),
      home: PlanProvider(
        notifier: ValueNotifier<Plan>(const Plan()),
        child: const PlanScreen(),
      ),
    );
  }
}
