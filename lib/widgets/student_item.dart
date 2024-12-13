import 'package:flutter/material.dart';
import 'package:yehortitarenko/models/student.dart';

class StudentItem extends StatelessWidget {
  const StudentItem({
    super.key,
    required this.student,
  });

  final Student student;

  @override
  Widget build(BuildContext context) {
    final Color cardColor =
        student.gender == Gender.male ? Colors.blue : Colors.pink;

    final IconData departmentIcon;
    switch (student.department) {
      case Department.it:
        departmentIcon = Icons.computer;
        break;
      case Department.finance:
        departmentIcon = Icons.account_balance;
        break;
      case Department.law:
        departmentIcon = Icons.gavel;
        break;
      case Department.medical:
        departmentIcon = Icons.medical_services;
        break;
    }

    return Card(
      color: cardColor,
      child: ListTile(
        leading: Text(
          '${student.firstName} ${student.lastName}',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(departmentIcon, color: Colors.white),
            const SizedBox(width: 8),
            Text(
              student.grade.toString(),
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
