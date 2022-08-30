import 'package:flutter/material.dart';
import 'package:todo_app/shared/style/colors.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Expanded(
              child: Container(),
            ),
            Expanded(
              flex: 7,
              child: Container(
                color: onPrimaryColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('Language'),

                  ],
                ),
              ),
            ),
          ],
        ),

      ],
    );
  }
}
