import 'package:flutter/material.dart';

import '../../../../core/styles/colors.dart';

class ProfileItemWidget extends StatelessWidget {
  IconData icon;
  String title;
  VoidCallback onTap;

   ProfileItemWidget({super.key,required this.icon, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Icon(icon,size: 24,),
            const SizedBox(width: 12),
            Expanded(
                child: Text(title,style: Theme.of(context).textTheme.titleSmall,)),
            const Icon(Icons.arrow_forward_outlined, size: 24,color: grayDarkColor,),
            Divider(color: grayColor,thickness: 1,)
          ],
        ),
      ),
    );
  }
}
