import 'package:flutter/material.dart';
import '../models/student.dart';
import 'student_item.dart';
import 'new_student.dart';

class StudentsWidget extends StatefulWidget {
  @override
  _StudentsWidgetState createState() => _StudentsWidgetState();
}

class _StudentsWidgetState extends State<StudentsWidget> {
  List<Student> students = [
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

  void _openNewStudentModal(BuildContext context, {Student? student}) async {
    final result = await showModalBottomSheet<Student>(
      context: context,
      builder: (ctx) => NewStudent(student: student),
    );
    if (result != null) {
      setState(() {
        if (student == null) {
          students.add(result);
        } else {
          final index = students.indexOf(student);
          students[index] = result;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Students'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _openNewStudentModal(context),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (ctx, index) {
          return Dismissible(
            key: ValueKey(students[index].firstName),
            onDismissed: (direction) {
              final removedStudent = students[index];
              setState(() {
                students.removeAt(index);
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                      '${removedStudent.firstName} ${removedStudent.lastName} removed'),
                  action: SnackBarAction(
                    label: 'Undo',
                    onPressed: () {
                      setState(() {
                        students.insert(index, removedStudent);
                      });
                    },
                  ),
                ),
              );
            },
            background: Container(color: Colors.red),
            child: InkWell(
              onTap: () =>
                  _openNewStudentModal(context, student: students[index]),
              child: StudentItem(student: students[index]),
            ),
          );
        },
      ),
    );
  }
}
