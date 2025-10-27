import 'package:flutter/material.dart';
import './views/plan_screen.dart';

void main() => runApp(MasterPlanApp());

class MasterPlanApp extends StatelessWidget {
  const MasterPlanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.purple, // warna header
          foregroundColor: Colors.white, // warna teks di AppBar
        ),
      ),
      home: PlanScreen(),
    );
  }
}
