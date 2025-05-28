import 'package:flutter/material.dart';
import 'package:tasky_app_iti/core/styles/colors.dart';

class AddTask extends StatelessWidget {
  static String routeName = 'AddTask';

  const AddTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'New Task',
          style: Theme.of(context).textTheme.bodyLarge),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Task Name",
                style:Theme.of(context).textTheme.titleSmall
              ),
              SizedBox(height: 8,),

              TextFormField(
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                decoration: InputDecoration(
                    fillColor: Color(0xFF282828),
                    filled: true,
                    hintText: 'Finish UI design for login screen',
                    hintStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Color(0xFF6D6D6D),
                    ),
                    labelStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Color(0xFF6D6D6D),
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

              SizedBox(height: 20,),

              Text(
                "Task Description",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              SizedBox(height: 8,),

              TextFormField(
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                maxLines: 8,
                decoration:  InputDecoration(
                    fillColor: Color(0xFF282828),
                    filled: true,
                    hintText: 'Finish onboarding UI and hand off to\ndevs by Thursday.',
                    hintStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Color(0xFF6D6D6D),
                    ),
                    labelStyle:  Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Color(0xFF6D6D6D),
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
              SizedBox(height: 20,),
              Row(
                children: [
                  Text(
                    "High Priority",
                    style: Theme.of(context).textTheme.titleSmall
                  ),
                  Spacer(),
                  Switch(
                    activeColor: whiteColor,
                    activeTrackColor: mainPrimaryGreenColor,
                    value: true,
                    onChanged: (value) {},
                  ),
                ],
              ),

              SizedBox(height: 150,),
              ElevatedButton(onPressed: (){}, child: Text(
                  "+ Add Task",
                style: Theme.of(context).textTheme.bodySmall
              ))
            ],
          ),
        ),
      ),
    );
  }
}
