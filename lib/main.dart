import 'package:flutter/material.dart';
import 'package:task_management_app/Controllers/data_controller.dart';
import 'package:task_management_app/screens/add_task.dart';
import 'package:task_management_app/screens/all_tasks.dart';
import 'package:task_management_app/screens/home_screen.dart';
import 'package:get/get.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  loadData() async {
    await Get.find<DataController>().getData();
  }
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => DataController());
    loadData();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

