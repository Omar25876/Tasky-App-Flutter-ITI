import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tasky_app_iti/core/components/custom_textformfield.dart';
import 'package:tasky_app_iti/features/home_navigation_bar.dart';
import '../../core/helpers/shared_pref_helper.dart';
import '../../core/styles/colors.dart';

class StartWidgetView extends StatefulWidget {
  static String routeName = 'StartWidgetView';

  const StartWidgetView({super.key});

  @override
  State<StartWidgetView> createState() => _StartWidgetViewState();
}

class _StartWidgetViewState extends State<StartWidgetView> {
  final TextEditingController _nameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> login() async {
    if (!_formKey.currentState!.validate()) return;

    final name = _nameController.text.trim();

    await SharedPrefHelper.saveUserName(name);
    Navigator.pushReplacementNamed(context, HomeNavigationBar.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/images/logo.svg', width: 42, height: 42),
            const SizedBox(width: 16),
            Text("Tasky", style: Theme.of(context).textTheme.headlineLarge),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 108),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Welcome to Tasky",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(width: 8),
                    SvgPicture.asset(
                      'assets/images/waving_hand.svg',
                      width: 28,
                      height: 28,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  "Your productivity journey starts here.",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: 24),
                SvgPicture.asset('assets/images/pana.svg', width: 215, height: 205),
                const SizedBox(height: 28),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Full Name",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                CustomTextformfield(
                  controller: _nameController,
                  hint: 'e.g. Sarah Khalid',
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your full name';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: login,
                  child: Text(
                    "Let's Get Started",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
