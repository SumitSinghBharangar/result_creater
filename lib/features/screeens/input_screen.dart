import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:result_creater/constants/widgets/custom_textfield.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  final _fKey1 = GlobalKey<FormState>();
  final TextEditingController _totalController = TextEditingController();
  final TextEditingController _aController = TextEditingController();
  final TextEditingController _bController = TextEditingController();
  final TextEditingController _cController = TextEditingController();
  final TextEditingController _dController = TextEditingController();
  final TextEditingController _fController = TextEditingController();

  @override
  void dispose() {
    _totalController.dispose();
    _aController.dispose();
    _bController.dispose();
    _cController.dispose();
    _dController.dispose();
    _fController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Input Screen",
          style: TextStyle(
              fontSize: 22.sp,
              color: Colors.black,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: SingleChildScrollView(
          child: Form(
            key: _fKey1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  "total No. of Students",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 7.h,
                ),
                CustomTextField(
                  controller: _totalController,
                  autofocus: true,
                  hintText: "Enter total No. of students",
                  removeFocusOutside: true,
                  iconData: Icons.people_outline,
                  isNumber: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "This can't be empty";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "As Students",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 7.h,
                ),
                CustomTextField(
                  controller: _aController,
                  hintText: "Enter students of group A",
                  removeFocusOutside: true,
                  iconData: Icons.people_outline,
                  isNumber: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "This can't be empty";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "Bs Students",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 7.h,
                ),
                CustomTextField(
                  controller: _bController,
                  hintText: "Enter students of group B",
                  removeFocusOutside: true,
                  iconData: Icons.people_outline,
                  isNumber: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "This can't be empty";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "Cs Students",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 7.h,
                ),
                CustomTextField(
                  controller: _cController,
                  hintText: "Enter students of group C",
                  removeFocusOutside: true,
                  iconData: Icons.people_outline,
                  isNumber: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "This can't be empty";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "Ds Students",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 7.h,
                ),
                CustomTextField(
                  controller: _dController,
                  autofocus: true,
                  hintText: "Enter students of group D",
                  removeFocusOutside: true,
                  iconData: Icons.people_outline,
                  isNumber: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "This can't be empty";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "Fs Students",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 7.h,
                ),
                CustomTextField(
                  controller: _fController,
                  autofocus: true,
                  hintText: "Enter students of group F",
                  removeFocusOutside: true,
                  iconData: Icons.people_outline,
                  isNumber: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "This can't be empty";
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}