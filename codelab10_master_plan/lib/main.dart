import 'package:flutter/material.dart';
// import './views/plan_screen.dart';
import './models/plan.dart';
import './provider/plan_provider.dart';
import './views/plan_creator_screen.dart';

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
    return PlanProvider(
      notifier: ValueNotifier<List<Plan>>(const []),
      child: MaterialApp(
        title: 'State management app',
        
        theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.purple, // warna header
            foregroundColor: Colors.white, // warna teks di AppBar
          ),
      ),
        home: const PlanCreatorScreen(),
      ),
    );
  }
}
