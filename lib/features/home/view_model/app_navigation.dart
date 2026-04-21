import 'package:smart_university_app/features/courses/presentation/views/widgets/courses_view_body.dart';
import 'package:smart_university_app/features/home/model/navigation_item.dart';
import 'package:smart_university_app/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:smart_university_app/features/profile/presentation/views/widgets/profile_view_body.dart';
import 'package:smart_university_app/features/results/presentation/views/widgets/result_view_body.dart';
import 'package:smart_university_app/features/schedule/presentation/views/widgets/scheduleviewbody.dart';

const List<NavigationItem> navigationItems = [
  NavigationItem(title: 'Home', page: HomeViewBody()),
  NavigationItem(title: 'Courses', page: CoursesViewBody()),
  NavigationItem(title: 'Schedule', page: Scheduleviewbody()),
  NavigationItem(title: 'Result', page: ResultViewBody()),
  NavigationItem(title: 'Profile', page: ProfileViewBody()),
];
