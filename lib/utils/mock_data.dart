import 'package:flutter/material.dart';
import 'package:smart_university_app/models/events_model.dart';
import 'package:smart_university_app/models/lecture_model.dart';
import 'package:smart_university_app/models/news_model.dart';
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
final List<String> courses = [
  'Digital Marketing',
  'Design Learning',
  'Artificial Intelligence',
  'Software Management',
  'Digital Logical Thoughts',
  'Web 3.0',
  'Calculas',
  'Physics',
  'Mathematics',
  'Data Science',
  'Machine Learning',
  'Cloud Computing',
  'Cybersecurity',
  'Mobile App Development',
  'Game Development',
  'Blockchain Technology',
  'Internet of Things',
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
    startTime: DateTime(2026, 4, 12, 15, 00),
    endTime: DateTime(2026, 4, 12, 16, 30),
    title: "UI/UX Design",
    subtitle: "Wireframing Basics",
    room: "Room 5B - 210",
    instructor: "Sara Ahmed",
    color: const Color(0xff81D4FA),
  ),
  LectureModel(
    startTime: DateTime(2026, 4, 12, 11, 35),
    endTime: DateTime(2026, 4, 12, 13, 05),
    title: "Computer Science",
    subtitle: "Lecture 2: Data management",
    room: "Room 2 - 124",
    instructor: "Marn Labiq Khalid",
    color: const Color(0xffA5D6A7),
  ),
  LectureModel(
    startTime: DateTime(2026, 4, 13, 13, 15),
    endTime: DateTime(2026, 4, 13, 14, 45),
    title: "Digital Marketing",
    subtitle: "Lecture 3: Shopify Creation",
    room: "Room 3A - G4",
    instructor: "Marn Hina",
    color: const Color(0xffDCE775),
  ),
  LectureModel(
    startTime: DateTime(2026, 4, 13, 15, 00),
    endTime: DateTime(2026, 4, 13, 16, 30),
    title: "UI/UX Design",
    subtitle: "Wireframing Basics",
    room: "Room 5B - 210",
    instructor: "Sara Ahmed",
    color: const Color(0xff81D4FA),
  ),
];
