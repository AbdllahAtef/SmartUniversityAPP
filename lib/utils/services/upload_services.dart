import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_university_app/providers/courses_provider.dart';

Future<void> pickFile(WidgetRef ref, BuildContext context) async {
  final result = await FilePicker.pickFiles();

  if (result != null) {
    final file = result.files.first;

    const maxSize = 25 * 1024 * 1024;

    if (file.size > maxSize) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("File is too large (max 25 MB)")),
      );
      return;
    }

    ref.read(fileProvider.notifier).state = file;
  }
}
