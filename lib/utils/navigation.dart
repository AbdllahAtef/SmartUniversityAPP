import 'package:smart_university_app/models/navigation_item.dart';
import 'package:smart_university_app/widgets/home_view_body.dart';
import 'package:smart_university_app/widgets/courses_view_body.dart';
import 'package:flutter/material.dart';
import 'package:smart_university_app/widgets/profile_view_body.dart';
import 'package:smart_university_app/widgets/result_view_body.dart';
import 'package:smart_university_app/widgets/scheduleviewbody.dart';

const navigationItems = [
  NavigationItem(title: "Home", page: HomeViewBody()),
  NavigationItem(title: "Courses", page: CoursesViewBody()),
  NavigationItem(title: "Schedule", page: Scheduleviewbody()),
  NavigationItem(title: "Result", page: ResultViewBody()),
  NavigationItem(title: "Profile", page: ProfileViewBody()),
];
