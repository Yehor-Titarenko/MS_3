import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/student.dart';

class StudentNotifier extends StateNotifier<List<Student>> {
  StudentNotifier()
      : super([
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
        ]);

  void addStudent(Student student) {
    state = [...state, student];
  }

  void addStudentAt(int index, Student student) {
    final students = [...state];
    students.insert(index, student);
    state = students;
  }

  void editStudent(int index, Student updatedStudent) {
    final students = [...state];
    students[index] = updatedStudent;
    state = students;
  }

  void deleteStudent(int index) {
    final students = [...state];
    students.removeAt(index);
    state = students;
  }
}

final studentProvider = StateNotifierProvider<StudentNotifier, List<Student>>(
  (ref) => StudentNotifier(),
);

final departmentStudentCountsProvider = Provider<Map<Department, int>>((ref) {
  final students = ref.watch(studentProvider);

  final counts = <Department, int>{
    for (var department in Department.values) department: 0,
  };

  for (var student in students) {
    counts[student.department] = (counts[student.department] ?? 0) + 1;
  }

  return counts;
});

class DeletedStudentNotifier extends StateNotifier<Map<int, Student>> {
  DeletedStudentNotifier() : super({});

  void setDeletedStudent(int index, Student student) {
    state = {index: student};
  }

  void clearDeletedStudent() {
    state = {};
  }
}

final deletedStudentProvider =
    StateNotifierProvider<DeletedStudentNotifier, Map<int, Student>>(
  (ref) => DeletedStudentNotifier(),
);
