import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_university_app/providers/logout_controller.dart';
import 'package:smart_university_app/screens/sign_in_screen.dart';
import 'package:smart_university_app/widgets/custom_list_tile.dart';

class Settings extends ConsumerWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomListTile(
            icon: Icons.dark_mode,
            title: "Dark Mode",
            onTap: () {},
            iconColor: Colors.black,
          ),
          CustomListTile(
            icon: Icons.language,
            title: "Language",
            onTap: () {},
            iconColor: Colors.blueAccent,
          ),
          CustomListTile(
            icon: Icons.logout,
            title: "Logout",
            iconColor: Colors.red,
            onTap: () {
              ref.read(logoutControllerProvider).logout();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const SignInScreen()),
                (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}
