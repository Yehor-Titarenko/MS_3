import 'package:flutter/material.dart';
import '../models/student.dart';

class NewStudent extends StatefulWidget {
  final Student? student;

  const NewStudent({Key? key, this.student}) : super(key: key);

  @override
  _NewStudentState createState() => _NewStudentState();
}

class _NewStudentState extends State<NewStudent> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  Department _selectedDepartment = Department.finance;
  Gender _selectedGender = Gender.male;
  final _gradeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.student != null) {
      _firstNameController.text = widget.student!.firstName;
      _lastNameController.text = widget.student!.lastName;
      _selectedDepartment = widget.student!.department;
      _selectedGender = widget.student!.gender;
      _gradeController.text = widget.student!.grade.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _firstNameController,
            decoration: const InputDecoration(labelText: 'First Name'),
          ),
          TextField(
            controller: _lastNameController,
            decoration: const InputDecoration(labelText: 'Last Name'),
          ),
          DropdownButton<Department>(
            value: _selectedDepartment,
            items: Department.values.map((department) {
              return DropdownMenuItem<Department>(
                value: department,
                child: Text(department.toString().split('.').last),
              );
            }).toList(),
            onChanged: (newValue) {
              setState(() {
                _selectedDepartment = newValue!;
              });
            },
          ),
          DropdownButton<Gender>(
            value: _selectedGender,
            items: Gender.values.map((gender) {
              return DropdownMenuItem<Gender>(
                value: gender,
                child: Text(gender.toString().split('.').last),
              );
            }).toList(),
            onChanged: (newValue) {
              setState(() {
                _selectedGender = newValue!;
              });
            },
          ),
          TextField(
            controller: _gradeController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Grade'),
          ),
          ElevatedButton(
            onPressed: () {
              final newStudent = Student(
                firstName: _firstNameController.text,
                lastName: _lastNameController.text,
                department: _selectedDepartment,
                grade: int.parse(_gradeController.text),
                gender: _selectedGender,
              );
              Navigator.of(context).pop(newStudent);
            },
            child:
                Text(widget.student == null ? 'Add Student' : 'Edit Student'),
          ),
        ],
      ),
    );
  }
}
