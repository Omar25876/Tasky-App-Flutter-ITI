import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasky_app_iti/core/styles/colors.dart';
import 'package:tasky_app_iti/features/add_task/add_task.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: 42,
                    width: 42,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      'assets/images/av.png',
                      height: 42,
                      width: 42,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 8,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Good Evening ,Usama",
                        style:  Theme.of(context).textTheme.titleSmall
                      ),
                      Text(
                        "One task at a time.One step\ncloser.",
                        style:  Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: grayDarkColor
                        ),
                      ),
                    ],
                  ),

                  Spacer(),

                  Container(
                    height: 34,
                    width: 34,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: grayColor,
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/images/themeIcon.svg',
                        height: 18,
                        width: 18,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 16,),

              Text(
                "Yuhuu ,Your work Is ",
                style:  Theme.of(context).textTheme.titleLarge
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "almost done ! ",
                    style: Theme.of(context).textTheme.titleLarge
                  ),
                  SizedBox(width: 8),
                  SvgPicture.asset(
                    'assets/images/waving_hand.svg',
                    width: 32,
                    height: 32,
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.pushNamed(context, AddTask.routeName),
        backgroundColor: mainPrimaryGreenColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        icon: const Icon(Icons.add, color: whiteColor,size: 18,),
        label: Text(
          "Add New Task",
          style: Theme.of(context).textTheme.bodySmall
        ),
      ),

    );

  }
}
