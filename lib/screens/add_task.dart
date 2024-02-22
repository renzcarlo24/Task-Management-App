import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_management_app/Controllers/data_controller.dart';
import 'package:task_management_app/screens/all_tasks.dart';
import 'package:task_management_app/utils/app_colors.dart';
import 'package:task_management_app/widgets/button_widget.dart';
import 'package:task_management_app/widgets/error_warning_ms.dart';
import 'package:task_management_app/widgets/textfield_widget.dart';
import 'package:get/get.dart';
class AddTask extends StatelessWidget {
  const AddTask({super.key});

  @override
  Widget build(BuildContext context) {

    TextEditingController nameController = TextEditingController();
    TextEditingController detailController = TextEditingController();

    //form validation
    bool _dataValidation(){
      if(nameController.text.trim()==''){
        Message.taskErrorOrWarning("Task name", "Your task name is empty");
        return false;
      }else if(detailController.text.trim()==''){
        Message.taskErrorOrWarning("Task detail", "Your task detail is empty");
        return false;
      } else if(nameController.text.length<=10){
        Message.taskErrorOrWarning("Task name", "Your task name should be at least 10 characters");
        return false;
      } else if (detailController.text.length<=20){
        Message.taskErrorOrWarning("Task Detail", "Your task detail should be at least 20 characters");
        return false;
      }

      return true;
    }

    return Scaffold(
    body: Container(
      width: double.maxFinite,
      height: double.maxFinite,
      padding: const EdgeInsets.only(left: 20, right: 20),
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image:AssetImage(
            "assets/background1.jpg"
          )
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(

           children: [
            const SizedBox(height: 40,),
            IconButton(onPressed: (){
              Get.back();
            }, 
            icon: Icon(Icons.arrow_back,
            color: AppColors.secondaryColor,

            ))
        ]),

        Column(
          children: [
            TextFieldWidget(textController: nameController, 
            hintText: "Task name"),
            const SizedBox(height: 20,),
            TextFieldWidget(textController: detailController, 
            hintText: "Task detail", 
            borderRadius: 15,
            maxLines: 3,),
            const SizedBox(height: 20,),
            GestureDetector(
                onTap: (){
                  if(_dataValidation());{
                      Get.find<DataController>().postData(
                          nameController.text.trim(),
                          detailController.text.trim());
                      Get.to(()=> AllTasks(),
                      transition: Transition.circularReveal,
                      );
                  }
                },
              child: ButtonWidget(backgroundcolor: AppColors.mainColor,
              text: "Add", textColor: Colors.white),
            )
          ],
        )
      ,
      SizedBox(
        height: MediaQuery.of(context).size.height/20,
      )
      ],

      ),
      ),
    );
  }
}