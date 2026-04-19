import 'package:flutter/material.dart';
import 'package:smart_university_app/models/assignments_model.dart';
import 'package:smart_university_app/models/courses_model.dart';
import 'package:smart_university_app/models/events_model.dart';
import 'package:smart_university_app/models/grades_model.dart';
import 'package:smart_university_app/models/lecture_model.dart';
import 'package:smart_university_app/models/news_model.dart';
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
    image: "assets/images/event1.jpg",
  ),
  EventModel(
    title: "Pathways to Development Conference",
    location: "Lahore",
    date: "Fri, 19 Apr 2024",
    image: "assets/images/event2.jpg",
  ),
  EventModel(
    title: "IELTS Information Session",
    location: "Karachi",
    date: "Mon, 10 Jun 2024",
    image: "assets/images/event3.jpg",
  ),
  EventModel(
    title: "IDP Study Abroad Expo",
    location: "Islamabad",
    date: "Wed, 28 Feb 2024",
    image: "assets/images/event1.jpg",
  ),
  EventModel(
    title: "Pathways to Development Conference",
    location: "Lahore",
    date: "Fri, 19 Apr 2024",
    image: "assets/images/event2.jpg",
  ),
  EventModel(
    title: "IELTS Information Session",
    location: "Karachi",
    date: "Mon, 10 Jun 2024",
    image: "assets/images/event3.jpg",
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
final List<GradesModel> mockGrades = [
  GradesModel(name: "Digital Marketing", grade: "A+", semester: "S2023"),
  GradesModel(name: "Design Learning", grade: "B", semester: "S2023"),
  GradesModel(name: "Software Management", grade: "B+", semester: "S2023"),
  GradesModel(name: "Digital Logic", grade: "C", semester: "S2023"),
  GradesModel(name: "Artificial Intelligence", grade: "F", semester: "S2023"),
  GradesModel(name: "Physics", grade: "A+", semester: "S2023"),
  GradesModel(name: "Mathematics", grade: "B", semester: "S2023"),
  GradesModel(name: "Data Science", grade: "B+", semester: "S2023"),
  GradesModel(name: "Machine Learning", grade: "C", semester: "S2023"),
  GradesModel(name: "Cloud Computing", grade: "F", semester: "S2023"),
  GradesModel(name: "Cybersecurity", grade: "A+", semester: "S2023"),
  GradesModel(name: "Mobile App Development", grade: "B", semester: "S2023"),
  GradesModel(name: "Game Development", grade: "B+", semester: "S2023"),
  GradesModel(name: "Blockchain Technology", grade: "C", semester: "S2023"),
  GradesModel(name: "Internet of Things", grade: "F", semester: "S2023"),
];
final assignments = [
  AssignmentModel(
    id: 1,
    courseId: 1,
    title: "Data Structures Assignment",
    description: "Analyze time complexity for linked lists",
    dueDate: DateTime(2026, 5, 10),
    maxGrade: 20,
  ),
  AssignmentModel(
    id: 2,
    courseId: 1,
    title: "Algorithms Homework",
    description: "Sorting algorithms implementation",
    dueDate: DateTime(2026, 5, 15),
    maxGrade: 25,
  ),
  AssignmentModel(
    id: 3,
    courseId: 1,
    title: "Operating Systems Assignment",
    description:
        "Implement process scheduling algorithms (FCFS & Round Robin).",
    dueDate: DateTime(2026, 5, 20),
    maxGrade: 30,
  ),

  AssignmentModel(
    id: 4,
    courseId: 1,
    title: "Database Systems Project",
    description: "Design a relational database with normalization and ERD.",
    dueDate: DateTime(2026, 5, 25),
    maxGrade: 40,
  ),
];
final quizzes = [
  QuizModel(
    id: 1,
    courseId: 1,
    title: "Quiz 1",
    totalGrade: 10,
    quizDate: DateTime(2026, 5, 5),
    durationMinutes: 15,
  ),
  QuizModel(
    id: 2,
    courseId: 1,
    title: "Quiz 2",
    totalGrade: 15,
    quizDate: DateTime(2026, 5, 8),
    durationMinutes: 20,
  ),
];
