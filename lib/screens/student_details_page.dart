import 'dart:io';


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_student/db/database_helper.dart';
import 'package:getx_student/getX/student_viewModel.dart';
import 'package:getx_student/model/student_model.dart';
import 'package:getx_student/screens/edit_student_page.dart';
import 'package:getx_student/screens/student_list_page.dart';


class StudentDetailPage extends StatelessWidget {
  final Student student;

  StudentDetailPage({required this.student});
  DatabaseHelper db = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    final StudentViewModel studentViewModel = StudentViewModel();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Delete Student'),
                  content:
                      Text('Are you sure you want to delete ${student.name}?'),
                  actions: [
                    TextButton(
                      child: const Text('Cancel'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    TextButton(
                      child: const Text('Delete'),
                      onPressed: () {
                        studentViewModel.deleteStudent(student.id);
                        Get.snackbar('Deleted', 'Student Successfully Deleted');
                        Get.offAll(()=>StudentList());
                      },
                    ),
                  ],
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              Get.to(()=>EditStudentPage(student: student))!.then((_) => Navigator.pop(context));
            },
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CircleAvatar(
              radius: 50.0,
              backgroundImage: FileImage(File(student.profilePicturePath)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Name: ${student.name}',
              style: const TextStyle(fontSize: 18.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Age: ${student.age}',
              style: const TextStyle(fontSize: 18.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Gender: ${student.gender}',
              style: const TextStyle(fontSize: 18.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Rollnumber: ${student.rollnumber}',
              style: const TextStyle(fontSize: 18.0),
            ),
          )
        ],
      ),
    );
  }
}
