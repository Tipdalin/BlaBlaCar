import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/widgets/actions/bla_button.dart';

class TestBlabutton extends StatelessWidget {
  const TestBlabutton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
              // 3 - BlaButtons
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BlaButton(
                    type: BlaButtonType.secondary,
                    icon: Icons.contact_support,
                    text: "Contact Volodia",
                    onPressed: () {
                      // 1 - Navigate to the rides screen (with a button to top animation)
                    },
                  ),
                  SizedBox(height: 10),
                  BlaButton(
                    type: BlaButtonType.primary,
                    icon: Icons.date_range,
                    text: "Request to book",
                    onPressed: () {
                      // 1 - Navigate to the rides screen (with a bottom to top animation)
                    },
                  ),
                ],
              )
              ],
            ),
    );
  }
}


