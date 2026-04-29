import 'package:flutter/material.dart';
import 'package:smart_university_app/models/assignments_model.dart';
import 'package:smart_university_app/models/courses_model.dart';

import 'package:smart_university_app/models/grades_model.dart';
import 'package:smart_university_app/models/lecture_model.dart';

import 'package:smart_university_app/models/quizes_model.dart';
import 'package:smart_university_app/models/subject_model.dart';

final List<SubjectModel> mockSubjects = [
  SubjectModel(title: "Computer Science", image: "assets/images/CS.jpg"),
  SubjectModel(title: "Mathematics", image: "assets/images/math.jpg"),
  SubjectModel(
    title: "History & Geography",
    image: "assets/images/geography.jpg",
  ),
  SubjectModel(title: "Art", image: "assets/images/Art.jpg"),
];

final mockGrades = [
  // ================= 🔵 2023 =================

  // Final
  GradesModel(
    name: "Mathematics I",
    type: "Final Grades",
    season: "2023",
    letterGrade: "A",
  ),
  GradesModel(
    name: "Physics I",
    type: "Final Grades",
    season: "2023",
    letterGrade: "B+",
  ),
  GradesModel(
    name: "Chemistry",
    type: "Final Grades",
    season: "2023",
    letterGrade: "A-",
  ),
  GradesModel(
    name: "Biology",
    type: "Final Grades",
    season: "2023",
    letterGrade: "B",
  ),
  GradesModel(
    name: "English",
    type: "Final Grades",
    season: "2023",
    letterGrade: "A",
  ),

  // Midterm
  GradesModel(
    name: "Mathematics I",
    type: "Midterm",
    season: "2023",
    score: 42,
    total: 50,
  ),
  GradesModel(
    name: "Physics I",
    type: "Midterm",
    season: "2023",
    score: 38,
    total: 50,
  ),
  GradesModel(
    name: "Chemistry",
    type: "Midterm",
    season: "2023",
    score: 40,
    total: 50,
  ),
  GradesModel(
    name: "Biology",
    type: "Midterm",
    season: "2023",
    score: 44,
    total: 50,
  ),
  GradesModel(
    name: "English",
    type: "Midterm",
    season: "2023",
    score: 46,
    total: 50,
  ),

  // Assignments
  GradesModel(
    name: "Mathematics I",
    type: "Assignments",
    season: "2023",
    score: 18,
    total: 20,
  ),
  GradesModel(
    name: "Physics I",
    type: "Assignments",
    season: "2023",
    score: 17,
    total: 20,
  ),
  GradesModel(
    name: "Chemistry",
    type: "Assignments",
    season: "2023",
    score: 19,
    total: 20,
  ),
  GradesModel(
    name: "Biology",
    type: "Assignments",
    season: "2023",
    score: 16,
    total: 20,
  ),
  GradesModel(
    name: "English",
    type: "Assignments",
    season: "2023",
    score: 20,
    total: 20,
  ),

  // Quizzes
  GradesModel(
    name: "Mathematics I",
    type: "Quizzes",
    season: "2023",
    score: 8,
    total: 10,
  ),
  GradesModel(
    name: "Physics I",
    type: "Quizzes",
    season: "2023",
    score: 7,
    total: 10,
  ),
  GradesModel(
    name: "Chemistry",
    type: "Quizzes",
    season: "2023",
    score: 9,
    total: 10,
  ),
  GradesModel(
    name: "Biology",
    type: "Quizzes",
    season: "2023",
    score: 8,
    total: 10,
  ),
  GradesModel(
    name: "English",
    type: "Quizzes",
    season: "2023",
    score: 9,
    total: 10,
  ),

  // ================= 🔵 2024 =================

  // Final
  GradesModel(
    name: "Data Structures",
    type: "Final Grades",
    season: "2024",
    letterGrade: "A+",
  ),
  GradesModel(
    name: "Algorithms",
    type: "Final Grades",
    season: "2024",
    letterGrade: "A",
  ),
  GradesModel(
    name: "Databases",
    type: "Final Grades",
    season: "2024",
    letterGrade: "B+",
  ),
  GradesModel(
    name: "Operating Systems",
    type: "Final Grades",
    season: "2024",
    letterGrade: "B",
  ),
  GradesModel(
    name: "Discrete Math",
    type: "Final Grades",
    season: "2024",
    letterGrade: "A-",
  ),

  // Midterm
  GradesModel(
    name: "Data Structures",
    type: "Midterm",
    season: "2024",
    score: 47,
    total: 50,
  ),
  GradesModel(
    name: "Algorithms",
    type: "Midterm",
    season: "2024",
    score: 44,
    total: 50,
  ),
  GradesModel(
    name: "Databases",
    type: "Midterm",
    season: "2024",
    score: 41,
    total: 50,
  ),
  GradesModel(
    name: "Operating Systems",
    type: "Midterm",
    season: "2024",
    score: 39,
    total: 50,
  ),
  GradesModel(
    name: "Discrete Math",
    type: "Midterm",
    season: "2024",
    score: 45,
    total: 50,
  ),

  // Assignments
  GradesModel(
    name: "Data Structures",
    type: "Assignments",
    season: "2024",
    score: 20,
    total: 20,
  ),
  GradesModel(
    name: "Algorithms",
    type: "Assignments",
    season: "2024",
    score: 19,
    total: 20,
  ),
  GradesModel(
    name: "Databases",
    type: "Assignments",
    season: "2024",
    score: 18,
    total: 20,
  ),
  GradesModel(
    name: "Operating Systems",
    type: "Assignments",
    season: "2024",
    score: 17,
    total: 20,
  ),
  GradesModel(
    name: "Discrete Math",
    type: "Assignments",
    season: "2024",
    score: 19,
    total: 20,
  ),

  // Quizzes
  GradesModel(
    name: "Data Structures",
    type: "Quizzes",
    season: "2024",
    score: 9,
    total: 10,
  ),
  GradesModel(
    name: "Algorithms",
    type: "Quizzes",
    season: "2024",
    score: 8,
    total: 10,
  ),
  GradesModel(
    name: "Databases",
    type: "Quizzes",
    season: "2024",
    score: 7,
    total: 10,
  ),
  GradesModel(
    name: "Operating Systems",
    type: "Quizzes",
    season: "2024",
    score: 8,
    total: 10,
  ),
  GradesModel(
    name: "Discrete Math",
    type: "Quizzes",
    season: "2024",
    score: 9,
    total: 10,
  ),

  // ================= 🔵 2025 =================

  // Final
  GradesModel(
    name: "Artificial Intelligence",
    type: "Final Grades",
    season: "2025",
    letterGrade: "A+",
  ),
  GradesModel(
    name: "Machine Learning",
    type: "Final Grades",
    season: "2025",
    letterGrade: "A",
  ),
  GradesModel(
    name: "Computer Networks",
    type: "Final Grades",
    season: "2025",
    letterGrade: "B+",
  ),
  GradesModel(
    name: "Cyber Security",
    type: "Final Grades",
    season: "2025",
    letterGrade: "A-",
  ),
  GradesModel(
    name: "Mobile Development",
    type: "Final Grades",
    season: "2025",
    letterGrade: "A",
  ),

  // Midterm
  GradesModel(
    name: "Artificial Intelligence",
    type: "Midterm",
    season: "2025",
    score: 48,
    total: 50,
  ),
  GradesModel(
    name: "Machine Learning",
    type: "Midterm",
    season: "2025",
    score: 45,
    total: 50,
  ),
  GradesModel(
    name: "Computer Networks",
    type: "Midterm",
    season: "2025",
    score: 42,
    total: 50,
  ),
  GradesModel(
    name: "Cyber Security",
    type: "Midterm",
    season: "2025",
    score: 44,
    total: 50,
  ),
  GradesModel(
    name: "Mobile Development",
    type: "Midterm",
    season: "2025",
    score: 46,
    total: 50,
  ),

  // Assignments
  GradesModel(
    name: "Artificial Intelligence",
    type: "Assignments",
    season: "2025",
    score: 20,
    total: 20,
  ),
  GradesModel(
    name: "Machine Learning",
    type: "Assignments",
    season: "2025",
    score: 19,
    total: 20,
  ),
  GradesModel(
    name: "Computer Networks",
    type: "Assignments",
    season: "2025",
    score: 18,
    total: 20,
  ),
  GradesModel(
    name: "Cyber Security",
    type: "Assignments",
    season: "2025",
    score: 19,
    total: 20,
  ),
  GradesModel(
    name: "Mobile Development",
    type: "Assignments",
    season: "2025",
    score: 20,
    total: 20,
  ),

  // Quizzes
  GradesModel(
    name: "Artificial Intelligence",
    type: "Quizzes",
    season: "2025",
    score: 10,
    total: 10,
  ),
  GradesModel(
    name: "Machine Learning",
    type: "Quizzes",
    season: "2025",
    score: 9,
    total: 10,
  ),
  GradesModel(
    name: "Computer Networks",
    type: "Quizzes",
    season: "2025",
    score: 8,
    total: 10,
  ),
  GradesModel(
    name: "Cyber Security",
    type: "Quizzes",
    season: "2025",
    score: 9,
    total: 10,
  ),
  GradesModel(
    name: "Mobile Development",
    type: "Quizzes",
    season: "2025",
    score: 10,
    total: 10,
  ),
];
final assignments = [
  AssignmentModel(
    id: 1,
    courseId: 4, // Data Structures
    title: "Linked List Analysis",
    description:
        "Analyze time complexity of linked list operations and implement basic functions.",
    dueDate: DateTime(2026, 5, 10),
    maxGrade: 20,
  ),
  AssignmentModel(
    id: 2,
    courseId: 1, // CS
    title: "Sorting Algorithms",
    description: "Implement sorting algorithms and compare their performance. ",
    dueDate: DateTime(2026, 5, 15),
    maxGrade: 25,
  ),
  AssignmentModel(
    id: 3,
    courseId: 5, // OS
    title: "Process Scheduling",
    description:
        "FCFS & Round Robin scheduling algorithms implementation and analysis.",
    dueDate: DateTime(2026, 5, 20),
    maxGrade: 30,
  ),
  AssignmentModel(
    id: 4,
    courseId: 6, // DB
    title: "Database Design",
    description: "ERD + normalization for a library management system.",
    dueDate: DateTime(2026, 5, 25),
    maxGrade: 40,
  ),
  AssignmentModel(
    id: 5,
    courseId: 10, // Mobile
    title: "Flutter UI",
    description: "Build responsive UI for a to-do list app using Flutter.",
    dueDate: DateTime(2026, 6, 1),
    maxGrade: 20,
  ),
];
final quizzes = [
  QuizModel(
    id: 1,
    courseId: 4,
    title: "DS Quiz",
    totalGrade: 10,
    quizDate: DateTime(2026, 5, 5),
    durationMinutes: 15,
  ),
  QuizModel(
    id: 2,
    courseId: 6,
    title: "DB Quiz",
    totalGrade: 15,
    quizDate: DateTime(2026, 5, 8),
    durationMinutes: 20,
  ),
  QuizModel(
    id: 3,
    courseId: 10,
    title: "Flutter Quiz",
    totalGrade: 20,
    quizDate: DateTime(2026, 5, 12),
    durationMinutes: 25,
  ),
];
