import 'package:flutter/material.dart';

class FacultyDropdown extends StatelessWidget {
  final String? selectedFaculty;
  final Function(String?) onChanged;

  static final List<String> faculties = [
    "Computer Science",
    "Engineering",
    "Medicine",
    "Pharmacy",
    "Commerce",
    "Law",
    "Arts",
    "Business",
    "Science",
    "Humanities",
    "Social Sciences",
    "Other",
  ];

  const FacultyDropdown({
    super.key,
    required this.selectedFaculty,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Select Faculty",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        DropdownButtonFormField<String>(
          focusColor: Colors.transparent,
          dropdownColor: Colors.grey.shade100,
          value: selectedFaculty,
          hint: const Text("Choose your faculty"),
          items: faculties.map((faculty) {
            return DropdownMenuItem(value: faculty, child: Text(faculty));
          }).toList(),
          onChanged: onChanged,
          decoration: InputDecoration(
            border: OutLineBorder(),
            focusedBorder: OutLineBorder(),
            enabledBorder: OutLineBorder(),
            errorBorder: OutLineBorder(),
            focusedErrorBorder: OutLineBorder(),
          ),
        ),
      ],
    );
  }

  UnderlineInputBorder OutLineBorder() {
    return UnderlineInputBorder(
      borderSide: BorderSide(color: const Color(0xFF949494).withOpacity(0.5)),
    );
  }
}
