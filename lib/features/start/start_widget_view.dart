import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tasky_app_iti/core/styles/colors.dart';
import 'package:tasky_app_iti/features/home_navigation_bar.dart';

class StartWidgetView extends StatelessWidget {
  static String routeName = 'StartWidgetView';

  const StartWidgetView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/images/logo.svg', width: 42, height: 42),
            SizedBox(width: 16),
            Text(
              "Tasky",
              style:Theme.of(context).textTheme.headlineLarge
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: 108,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Welcome to Tasky",
                    style:Theme.of(context).textTheme.titleMedium
                  ),
                  SizedBox(width: 8),
                  SvgPicture.asset(
                    'assets/images/waving_hand.svg',
                    width: 28,
                    height: 28,
                  ),
                ],
              ),

              SizedBox(height: 8),

              Text(
                "Your productivity journey starts here.",
                style: Theme.of(context).textTheme.titleSmall
              ),

              SizedBox(height: 24),

              SvgPicture.asset('assets/images/pana.svg', width: 215, height: 205),

              SizedBox(height: 28),

             Row(
               mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 Text(
                   "Full Name",
                   style: Theme.of(context).textTheme.titleSmall
                 ),
               ],
             ),

              SizedBox(height: 8),

              TextFormField(
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                decoration:   InputDecoration(
                  fillColor: Color(0xFF282828),
                  filled: true,
                  hintText: 'e.g. Sarah Khalid',
                  hintStyle:  Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Color(0xFF6D6D6D),
                  ),
                  labelStyle:  TextStyle(color: Color(0xFF6D6D6D)),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  )
                ),
              ),

              SizedBox(height: 24),

              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, HomeNavigationBar.routeName);
                },
                child: Text(
                  "Let's Get Started",
                  style:  Theme.of(context).textTheme.bodySmall
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
