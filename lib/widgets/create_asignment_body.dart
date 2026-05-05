import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_university_app/models/courses_model.dart';
import 'package:smart_university_app/providers/assignment_provider.dart';
import 'package:smart_university_app/utils/styles.dart';
import 'package:smart_university_app/widgets/assignment_form_section.dart';
import 'package:smart_university_app/widgets/course_details_card.dart';
import 'package:smart_university_app/widgets/course_header.dart';
import 'package:smart_university_app/widgets/submit_assignment_section.dart';

class CreateAsignmentBody extends ConsumerStatefulWidget {
  final CourseModel course;
  const CreateAsignmentBody({super.key, required this.course});

  @override
  ConsumerState<CreateAsignmentBody> createState() =>
      _CreateAsignmentBodyState();
}

class _CreateAsignmentBodyState extends ConsumerState<CreateAsignmentBody> {
  late TextEditingController titleController;
  late TextEditingController descController;
  late TextEditingController dateController;
  late TextEditingController gradeController;

  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    descController = TextEditingController();
    dateController = TextEditingController();
    gradeController = TextEditingController();
    ref.listenManual(createAssignmentProvider, (prev, next) {
      if (next is AsyncData) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Assignment created successfully")),
        );

        ref.invalidate(assignmentsProvider(widget.course.id));

        Navigator.pop(context);
      }
    });
  }

  @override
  void dispose() {
    titleController.dispose();
    descController.dispose();
    dateController.dispose();
    gradeController.dispose();
    super.dispose();
  }

  void _pickDate() async {
    final pickedDate = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
      initialDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
        dateController.text =
            "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
      });
    }
  }

  void _submit() {
    if (titleController.text.isEmpty ||
        descController.text.isEmpty ||
        selectedDate == null ||
        gradeController.text.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Please fill all fields")));
      return;
    }

    ref
        .read(createAssignmentProvider.notifier)
        .create(
          title: titleController.text,
          description: descController.text,
          dueDate: selectedDate!,
          maxGrade: int.tryParse(gradeController.text) ?? 0,
          courseId: widget.course.id,
        );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(createAssignmentProvider);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CourseHeader(title: "Add Assignment"),
            SizedBox(height: 20.h),
            Center(
              child: CourseDetailsCard(
                title: widget.course.name,
                description: widget.course.description,
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              "Enter Assignment Details",
              style: TextStyles.textstyle16.copyWith(color: Colors.black54),
            ),
            SizedBox(height: 12.h),
            AssignmentFormSection(
              titleController: titleController,
              descController: descController,
              dateController: dateController,
              gradeController: gradeController,
              onPickDate: _pickDate,
            ),
            SizedBox(height: 50.h),
            SubmitAssignmentSection(state: state, onSubmit: _submit),
          ],
        ),
      ),
    );
  }
}
