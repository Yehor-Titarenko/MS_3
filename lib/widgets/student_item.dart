import 'package:flutter/material.dart';
import '../models/student.dart';

class StudentItem extends StatelessWidget {
  final Student student;

  const StudentItem({Key? key, required this.student}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final genderColor =
        student.gender == Gender.male ? Colors.blue : Colors.pink;

    return Container(
      color: genderColor,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${student.firstName} ${student.lastName}',
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
          Row(
            children: [
              Icon(
                departmentIcons[student.department],
                color: Colors.white,
              ),
              const SizedBox(width: 5),
              Text(
                '${student.grade}',
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
