import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';
import 'my_dialog_btn.dart';

showExitDialog(
    {required VoidCallback onCancel, required VoidCallback onConfirm}) {
  Get.defaultDialog(
      title: 'Finish Exam',
      titleStyle: TextStyle(color: primaryColor),
      content: Column(
        children: [
          Text('Are you sure to exit the exam?'),
          SizedBox(
            height: 16,
          ),
          MyDialogButton(title: 'OK', press: onConfirm),
          SizedBox(
            height: 8,
          ),
          MyDialogButton(
              title: 'Cancel',
              bgColor: Colors.white,
              titleColor: primaryColor,
              press: onCancel),
        ],
      ));
}
