import 'package:flutter/material.dart';
import 'package:smart_university_app/core/utils/app_assets.dart';
import 'package:smart_university_app/features/courses/model/assignments_model.dart';
import 'package:smart_university_app/features/courses/model/courses_model.dart';
import 'package:smart_university_app/features/home/model/events_model.dart';
import 'package:smart_university_app/features/results/model/grades_model.dart';
import 'package:smart_university_app/features/schedule/model/lecture_model.dart';
import 'package:smart_university_app/features/home/model/news_model.dart';
import 'package:smart_university_app/features/courses/model/quizes_model.dart';
import 'package:smart_university_app/features/home/model/subject_model.dart';

final List<SubjectModel> mockSubjects = [
  SubjectModel(title: "Computer Science", image: AppAssets.subjectCs),
  SubjectModel(title: "Mathematics", image: AppAssets.subjectMath),
  SubjectModel(
    title: "History & Geography",
    image: AppAssets.subjectGeography,
  ),
  SubjectModel(title: "Art", image: AppAssets.subjectArt),
];
final List<NewsModel> newsList = [
  NewsModel(
    title: "FBISE",
    description:
        "The Federal Board of Intermediate and Secondary Education has officially announced the date for the results.",
    date: "May 01",
  ),
  NewsModel(
    title: "Gaza",
    description:
        "The Pakistan Medical and Dental Council has permitted medical/dental students from Gaza.",
    date: "June 07",
  ),
  NewsModel(
    title: "LUMS",
    description:
        "LUMS recently celebrated the graduation of its latest batch of students.",
    date: "May 01",
  ),
  NewsModel(
    title: "FBISE",
    description:
        "The Federal Board of Intermediate and Secondary Education has officially announced the date for the results.",
    date: "May 01",
  ),
  NewsModel(
    title: "Gaza",
    description:
        "The Pakistan Medical and Dental Council has permitted medical/dental students from Gaza.",
    date: "June 07",
  ),
  NewsModel(
    title: "LUMS",
    description:
        "LUMS recently celebrated the graduation of its latest batch of students.",
    date: "May 01",
  ),
];
final List<EventModel> eventsList = [
  EventModel(
    title: "IDP Study Abroad Expo",
    location: "Islamabad",
    date: "Wed, 28 Feb 2024",
    image: AppAssets.event1,
  ),
  EventModel(
    title: "Pathways to Development Conference",
    location: "Lahore",
    date: "Fri, 19 Apr 2024",
    image: AppAssets.event2,
  ),
  EventModel(
    title: "IELTS Information Session",
    location: "Karachi",
    date: "Mon, 10 Jun 2024",
    image: AppAssets.event3,
  ),
  EventModel(
    title: "IDP Study Abroad Expo",
    location: "Islamabad",
    date: "Wed, 28 Feb 2024",
    image: AppAssets.event1,
  ),
  EventModel(
    title: "Pathways to Development Conference",
    location: "Lahore",
    date: "Fri, 19 Apr 2024",
    image: AppAssets.event2,
  ),
  EventModel(
    title: "IELTS Information Session",
    location: "Karachi",
    date: "Mon, 10 Jun 2024",
    image: AppAssets.event3,
  ),
];
final courses = [
  const CourseModel(
    id: 1,
    name: "Computer Science",
    code: "CS101",
    description:
        "Introduction to programming, algorithms, and problem solving.",
    doctorId: "D01",
    facultyId: "F01",
  ),
  const CourseModel(
    id: 2,
    name: "Mathematics",
    code: "MATH201",
    description: "Advanced calculus, limits, derivatives, and integrals.",
    doctorId: "D02",
    facultyId: "F01",
  ),
  const CourseModel(
    id: 3,
    name: "Physics",
    code: "PHY101",
    description: "Basic physics concepts including motion and energy.",
    doctorId: "D03",
    facultyId: "F02",
  ),
  const CourseModel(
    id: 4,
    name: "Data Structures",
    code: "CS202",
    description: "Stacks, queues, linked lists, trees, and graphs.",
    doctorId: "D01",
    facultyId: "F01",
  ),
  const CourseModel(
    id: 5,
    name: "Operating Systems",
    code: "CS303",
    description: "Processes, threads, memory management, and scheduling.",
    doctorId: "D04",
    facultyId: "F01",
  ),
  const CourseModel(
    id: 6,
    name: "Database Systems",
    code: "CS204",
    description: "SQL, normalization, and database design principles.",
    doctorId: "D05",
    facultyId: "F01",
  ),
  const CourseModel(
    id: 7,
    name: "Artificial Intelligence",
    code: "CS405",
    description: "Machine learning, search algorithms, and neural networks.",
    doctorId: "D06",
    facultyId: "F01",
  ),
  const CourseModel(
    id: 8,
    name: "Software Engineering",
    code: "CS301",
    description: "Software lifecycle, design patterns, and testing.",
    doctorId: "D07",
    facultyId: "F01",
  ),
  const CourseModel(
    id: 9,
    name: "Computer Networks",
    code: "CS302",
    description: "OSI model, TCP/IP, routing, and network security.",
    doctorId: "D08",
    facultyId: "F01",
  ),
  const CourseModel(
    id: 10,
    name: "Mobile App Development",
    code: "CS406",
    description: "Building cross-platform apps using Flutter.",
    doctorId: "D09",
    facultyId: "F01",
  ),
];
final lecturesMock = [
  LectureModel(
    startTime: DateTime(2026, 4, 14, 11, 35),
    endTime: DateTime(2026, 4, 14, 13, 05),
    title: "Computer Science",
    subtitle: "Lecture 2: Data management",
    room: "Room 2 - 124",
    instructor: "Marn Labiq Khalid",
    color: const Color(0xffA5D6A7),
  ),
  LectureModel(
    startTime: DateTime(2026, 4, 14, 13, 15),
    endTime: DateTime(2026, 4, 14, 14, 45),
    title: "Digital Marketing",
    subtitle: "Lecture 3: Shopify Creation",
    room: "Room 3A - G4",
    instructor: "Marn Hina",
    color: const Color(0xffDCE775),
  ),
  LectureModel(
    startTime: DateTime(2026, 4, 19, 15, 00),
    endTime: DateTime(2026, 4, 19, 16, 30),
    title: "UI/UX Design",
    subtitle: "Wireframing Basics",
    room: "Room 5B - 210",
    instructor: "Sara Ahmed",
    color: const Color(0xff81D4FA),
  ),
  LectureModel(
    startTime: DateTime(2026, 4, 19, 11, 35),
    endTime: DateTime(2026, 4, 19, 13, 05),
    title: "Computer Science",
    subtitle: "Lecture 2: Data management",
    room: "Room 2 - 124",
    instructor: "Marn Labiq Khalid",
    color: const Color(0xffA5D6A7),
  ),
  LectureModel(
    startTime: DateTime(2026, 4, 18, 13, 15),
    endTime: DateTime(2026, 4, 18, 14, 45),
    title: "Digital Marketing",
    subtitle: "Lecture 3: Shopify Creation",
    room: "Room 3A - G4",
    instructor: "Marn Hina",
    color: const Color(0xffDCE775),
  ),
  LectureModel(
    startTime: DateTime(2026, 4, 18, 15, 00),
    endTime: DateTime(2026, 4, 18, 16, 30),
    title: "UI/UX Design",
    subtitle: "Wireframing Basics",
    room: "Room 5B - 210",
    instructor: "Sara Ahmed",
    color: const Color(0xff81D4FA),
  ),
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
    description: "FCFS & Round Robin scheduling algorithms implementation and analysis.",
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
