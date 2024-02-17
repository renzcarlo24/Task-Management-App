import 'package:flutter/material.dart';
import 'package:task_management_app/utils/app_colors.dart';
import 'package:task_management_app/widgets/button_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: const EdgeInsets.only(left: 20, right: 20),
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              'assets/background1.jpg'
            )
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                text: "Hello",
                style: TextStyle(
                  color: AppColors.mainColor,
                  fontSize: 60,
                  fontWeight: FontWeight.bold
                  ),
                  children: [
                    TextSpan(
                     text: "\nStart your Beautiful Day",
                     style: TextStyle(
                         color: AppColors.smallTextColor,
                         fontSize: 14,
                         
                  ))
                  ]
                  ),
                  )
           ,  
           SizedBox(height: MediaQuery.of(context).size.height/2.5 ,),
           ButtonWidget(backgroundcolor: AppColors.mainColor, 
           text: "Add Task", 
           textColor: Colors.white),
           const SizedBox(height: 20,),
           ButtonWidget(backgroundcolor: Colors.white, 
           text: "View All", 
           textColor: AppColors.smallTextColor)
        ],),
      ),
    );
  }
}