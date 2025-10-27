import '../models/data_layer.dart';
import 'package:flutter/material.dart';
import '../provider/plan_provider.dart';

class PlanScreen extends StatefulWidget {
  final Plan plan;
  const PlanScreen({super.key, required this.plan});

  @override
  State createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  // Plan plan = const Plan();
  late ScrollController scrollController;
  Plan get plan => widget.plan;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController()
      ..addListener(() {
        FocusScope.of(context).requestFocus(FocusNode());
      });
  }

  @override
  Widget build(BuildContext context) {
    ValueNotifier<List<Plan>> plansNotifier = PlanProvider.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Master Plan Rangga')),
      body: ValueListenableBuilder<List<Plan>>(
        valueListenable: plansNotifier,
        builder: (context, plans, child) {
          Plan currentPlan = plans.firstWhere((p) => p.name == plan.name);
          return Column(
            children: [
              Expanded(child: _buildList(currentPlan)),
              SafeArea(child: Text(plan.completenessMessage)),
            ],
          );
        },
      ),
      floatingActionButton: _buildAddTaskButton(context),
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  Widget _buildAddTaskButton(BuildContext context) {
    ValueNotifier<List<Plan>> planNotifier = PlanProvider.of(context);
    return FloatingActionButton(
      backgroundColor: Colors.purple, // warna tombol +
      foregroundColor: Colors.white, // warna ikon +
      child: const Icon(Icons.add),
      onPressed: () {
        Plan currentPlan = planNotifier.value.firstWhere((p) => p.name == plan.name);
      int planIndex = planNotifier.value.indexOf(currentPlan);

      List<Task> updatedTasks = List<Task>.from(currentPlan.tasks)
        ..add(const Task());

      planNotifier.value = List<Plan>.from(planNotifier.value)
        ..[planIndex] = Plan(
          name: currentPlan.name,
          tasks: updatedTasks,
        );
      },
    );
  }

  Widget _buildList(Plan plan) {
    return ListView.builder(
      controller: scrollController,
      itemCount: plan.tasks.length,
      itemBuilder: (context, index) =>
          _buildTaskTile(plan.tasks[index], index, context),
    );
  }

  Widget _buildTaskTile(Task task, int index, BuildContext context) {
  ValueNotifier<List<Plan>> planNotifier = PlanProvider.of(context);
  Plan currentPlan = planNotifier.value.firstWhere((p) => p.name == plan.name);
  int planIndex = planNotifier.value.indexOf(currentPlan);

  return ListTile(
    leading: Checkbox(
      value: task.complete,
      onChanged: (selected) {
        final updatedTasks = List<Task>.from(currentPlan.tasks)
          ..[index] = Task(
            description: task.description,
            complete: selected ?? false,
          );

        planNotifier.value = List<Plan>.from(planNotifier.value)
          ..[planIndex] = Plan(name: currentPlan.name, tasks: updatedTasks);
      },
    ),
    title: TextFormField(
      initialValue: task.description,
      onChanged: (text) {
        final updatedTasks = List<Task>.from(currentPlan.tasks)
          ..[index] = Task(description: text, complete: task.complete);

        planNotifier.value = List<Plan>.from(planNotifier.value)
          ..[planIndex] = Plan(name: currentPlan.name, tasks: updatedTasks);
      },
    ),
  );
}

  }

