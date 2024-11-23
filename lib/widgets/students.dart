import 'package:flutter/material.dart';
import '../models/student.dart';
import 'student_item.dart';

class StudentsWidget extends StatelessWidget {
  final List<Student> students = [
    Student(
      firstName: "Yehor",
      lastName: "Titarenko",
      department: Department.finance,
      grade: 5,
      gender: Gender.male,
    ),
    Student(
      firstName: "Artem",
      lastName: "Sasko",
      department: Department.finance,
      grade: 3,
      gender: Gender.male,
    ),
    Student(
      firstName: "Karina",
      lastName: "Kolpashchikova",
      department: Department.law,
      grade: 5,
      gender: Gender.female,
    ),
    Student(
      firstName: "Artur",
      lastName: "Fenchenko",
      department: Department.medical,
      grade: 8,
      gender: Gender.male,
    ),
    Student(
      firstName: "Mykhailo",
      lastName: "Doroshyn",
      department: Department.it,
      grade: 2,
      gender: Gender.male,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Students'),
      ),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (ctx, index) {
          return StudentItem(student: students[index]);
        },
      ),
    );
  }
}
