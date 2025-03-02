import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/widgets/inputs/bla_location_picker.dart';
import '../../model/ride_pref/ride_pref.dart';
import '../../utils/animations_util.dart';

class RideScreen extends StatefulWidget {
  final RidePref? initialRidePref;

  const RideScreen({super.key, this.initialRidePref});

  @override
  State<RideScreen> createState() => _RideScreenState();
}

class _RideScreenState extends State<RideScreen> {
  onRidePrefSelected(RidePref ridePref) {
    // 1 - Navigate back to the previous screen
    Navigator.of(context).pop(ridePref);

    // 2 - Navigate to the rides screen (with a bottom to top animation)
    Navigator.of(context).push(AnimationUtils.createBottomToTopRoute(
        RideScreen(initialRidePref: ridePref)));
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 161, 195, 255),
      title: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return Column(
            children: [
              BlaLocationPicker(),
            ],
          );
        },
      ),
    );
  }
}
