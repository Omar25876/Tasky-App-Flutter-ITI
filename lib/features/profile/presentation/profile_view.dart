import 'package:flutter/material.dart';
import 'package:tasky_app_iti/features/profile/presentation/widgets/profile_item_widget.dart';
import 'package:tasky_app_iti/features/start/start_widget_view.dart';

import '../../../core/helpers/shared_pref_helper.dart';
import '../../../core/styles/colors.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  bool isDarkMode = true;

  Future<void> logout() async {
    await SharedPrefHelper.clearTasks();
    await SharedPrefHelper.clearUserName();
    Navigator.pushNamed(context, StartWidgetView.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(onPressed: () {}, color: whiteColor),
        title: Text('My Profile', style: Theme.of(context).textTheme.bodyLarge),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),

            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: const DecorationImage(
                      image: AssetImage('assets/images/av.png'),
                      fit: BoxFit.cover,
                    ),
                    border: Border.all(color: grayDarkColor, width: 1.5),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black54,
                  ),
                  padding: const EdgeInsets.all(6),
                  child: const Icon(
                    Icons.camera_alt,
                    color: whiteColor,
                    size: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            Text(
              "Usama Elgendy",
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
            ),

            // Subtitle
            const SizedBox(height: 4),
            Text(
              "One task at a time. One step closer.",
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: grayDarkColor),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 32),

            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Profile Info",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),

            const SizedBox(height: 16),

            ProfileItemWidget(
              icon: Icons.person_outline,
              title: 'User Details',
              onTap: () {},
            ),

            Divider(color: grayLightColor, thickness: 1),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  const Icon(Icons.dark_mode_outlined),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      "Dark Mode",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  Switch(
                    value: isDarkMode,
                    onChanged: (value) {},
                    activeColor: whiteColor,
                    activeTrackColor: mainPrimaryGreenColor,
                  ),
                ],
              ),
            ),

            Divider(color: grayLightColor, thickness: 1),

            ProfileItemWidget(
              icon: Icons.logout,
              title: 'Log Out',
              onTap:logout,
            ),
          ],
        ),
      ),
    );
  }
}
