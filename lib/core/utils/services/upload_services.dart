import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_university_app/features/courses/view_model/courses_view_model.dart';

Future<void> pickFile(WidgetRef ref, BuildContext context) async {
  final isPicking = ref.read(isPickingFileProvider);

  if (isPicking) return;

  ref.read(isPickingFileProvider.notifier).state = true;
  final messenger = ScaffoldMessenger.of(context);

  try {
    final result = await FilePicker.pickFiles();

    if (result != null && result.files.isNotEmpty) {
      final pickedFile = result.files.first;

      const maxSize = 25 * 1024 * 1024; // 25MB

      if (pickedFile.size > maxSize) {
        ref.read(fileProvider.notifier).state = null;

        messenger.showSnackBar(
          const SnackBar(
            content: Text("File is too large. Max size is 25 MB ❌"),
          ),
        );

        return;
      }
      ref.read(fileProvider.notifier).state = pickedFile;
    }
  } catch (e) {
    debugPrint(e.toString());

    messenger.showSnackBar(
      const SnackBar(content: Text("Error while picking file")),
    );
  } finally {
    ref.read(isPickingFileProvider.notifier).state = false;
  }
}
