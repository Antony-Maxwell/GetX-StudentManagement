import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_student/getX/student_viewModel.dart';
import 'package:getx_student/screens/add_student_page.dart';
import 'package:getx_student/screens/student_details_page.dart';


class StudentList extends StatefulWidget {
  const StudentList({super.key});

  @override
  State<StudentList> createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  final StudentViewModel studentList = Get.put(StudentViewModel());

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData()async{
    await studentList.fetchAllStudents();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 70,
        title: const Padding(
          padding: EdgeInsets.only(top: 25.0),
          child: Text(
            'GetX - Student Management',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.teal,
          onPressed: () {
            Get.to(()=>AddStudentPage());
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          )),
      body: Column(
        children: [
          Obx(() => studentList.allStudents.isEmpty
          ? Center(
                  child: Text(
                    'No Students Data Available'
                  ),
                )
          : Expanded(
            child:  GridView.builder(
            padding: const EdgeInsets.all(8.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 10.0,
            ),
            itemCount: studentList.allStudents.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Get.to(()=>StudentDetailPage(student: studentList.allStudents[index]));
                },
                child: Card(
                  color: const Color.fromARGB(255, 213, 213, 213),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 40.0,
                        backgroundColor: Colors.black,
                      ),
                      SizedBox(height: 8.0),
                      Text(studentList.allStudents[index].name),
                    ],
                  ),
                ),
              );
            }
            )
            ),
          )
        ],
      ),
    );
  }
}