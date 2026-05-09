import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_university_app/providers/ai_chat_provider.dart';
import 'package:smart_university_app/utils/styles.dart';
import 'package:smart_university_app/widgets/chat_bubble.dart';
import 'package:smart_university_app/widgets/chat_input_field.dart';
import 'package:smart_university_app/widgets/course_header.dart';

class AiAssistantBody extends ConsumerStatefulWidget {
  const AiAssistantBody({super.key});

  @override
  ConsumerState<AiAssistantBody> createState() => _AiAssistantBodyState();
}

class _AiAssistantBodyState extends ConsumerState<AiAssistantBody> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final messages = ref.watch(chatProvider);

    return Column(
      children: [
        const CourseHeader(title: 'Ai Assistant'),
        Expanded(
          child: messages.isEmpty
              ? Center(
                  child: Text(
                    "How can I help you today?",
                    style: TextStyles.textstyle16.copyWith(
                      color: const Color(0Xff8B2072),
                    ),
                  ),
                )
              : ListView.builder(
                  controller: _scrollController,
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  itemCount: messages.length,
                  itemBuilder: (context, index) =>
                      ChatBubble(message: messages[index]),
                ),
        ),
        ChatInputField(
          controller: _controller,
          onSend: () {
            if (_controller.text.trim().isNotEmpty) {
              ref
                  .read(chatProvider.notifier)
                  .sendMessage(_controller.text.trim());
              _controller.clear();
              _scrollToBottom();
            }
          },
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
