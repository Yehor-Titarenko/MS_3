import 'package:flutter/material.dart';
import 'package:yehortitarenko/models/department.dart';
import 'package:yehortitarenko/models/student.dart';

final List<DepartmentModel> departments = [
  DepartmentModel(
    id: '1',
    name: 'IT',
    color: Colors.blue,
    icon: Icons.computer,
    enumValue: Department.it,
  ),
  DepartmentModel(
    id: '2',
    name: 'Finance',
    color: Colors.yellow,
    icon: Icons.gavel,
    enumValue: Department.finance,
  ),
  DepartmentModel(
    id: '3',
    name: 'Law',
    color: Colors.grey,
    icon: Icons.gavel,
    enumValue: Department.law,
  ),
  DepartmentModel(
    id: '4',
    name: 'Medical',
    color: Colors.green,
    icon: Icons.medical_services,
    enumValue: Department.medical,
  ),
];
