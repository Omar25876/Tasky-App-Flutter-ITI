import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/styles/colors.dart';

class HeaderWidget extends StatelessWidget {
  String username ;
   HeaderWidget({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 42,
              width: 42,
              decoration: BoxDecoration(shape: BoxShape.circle),
              child: Image.asset(
                'assets/images/av.png',
                height: 42,
                width: 42,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Good Evening , $username",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Text(
                  "One task at a time.One step\ncloser.",
                  style: Theme.of(context).textTheme.bodyMedium
                      ?.copyWith(color: grayDarkColor),
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

        SizedBox(height: 16),

        Text(
          "Yuhuu ,Your work Is ",
          style: Theme.of(context).textTheme.titleLarge,
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "almost done ! ",
              style: Theme.of(context).textTheme.titleLarge,
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
    );
  }
}
