

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_student/getX/student_viewModel.dart';
import 'package:getx_student/model/student_model.dart';
import 'package:getx_student/screens/student_list_page.dart';


class EditStudentPage extends GetView<StudentViewModel> {
  EditStudentPage({super.key, required this.student}) {
    _nameController.text = student.name;
    _ageController.text = student.age.toString();
    _genderController.text = student.gender;
    _rollnumberController.text = student.rollnumber.toString();
  }
  final Student student;

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _genderController = TextEditingController();
  final _rollnumberController = TextEditingController();
  // final StudentViewModel controller = Get.put(StudentViewModel());
  // final StudentViewModel studentViewModel = StudentViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Edit Student ${student.name}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // CircleAvatar(
              //   radius: 50.0,
              //   backgroundImage:
              //       FileImage(File(updatedStudent.profilePicturePath)),
              // ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  labelText: 'Name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _ageController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  labelText: 'Age',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an age';
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _genderController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  labelText: 'Gender',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a gender';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 16.0,
              ),
              TextFormField(
                controller: _rollnumberController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  labelText: 'RollNumber',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter rollnumber';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 16.0,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final name = _nameController.text;
                    final age = int.parse(_ageController.text);
                    final rollnumber = int.parse(_rollnumberController.text);
                    final updateStudent = Student(
                      id: student.id,
                      name: name,
                      age: age,
                      gender: _genderController.text,
                      rollnumber: rollnumber,
                      profilePicturePath:'',
                    );
                    // studentViewModel.updateStudent(updateStudent);
                    Get.find<StudentViewModel>().updateStudent(updateStudent);
                    Get.back();
                    Get.snackbar('Updated', 'Student Updated');
                  }
                },
                child: const Text(
                  'Save Student',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
