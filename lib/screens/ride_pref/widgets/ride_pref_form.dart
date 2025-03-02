import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/screens/ride_pref/widgets/ride_pref_input.dart';
import 'package:week_3_blabla_project/theme/theme.dart';
import 'package:week_3_blabla_project/utils/animations_util.dart';
import 'package:week_3_blabla_project/utils/date_time_util.dart';
import 'package:week_3_blabla_project/widgets/actions/bla_button.dart';
import 'package:week_3_blabla_project/widgets/display/bla_divider.dart';
import 'package:week_3_blabla_project/widgets/inputs/bla_location_picker.dart';
import '../../../model/ride/locations.dart';
import '../../../model/ride_pref/ride_pref.dart';
import 'package:week_3_blabla_project/screens/rides/ride_screen.dart';

///
/// A Ride Preference From is a view to select:
///   - A departure location
///   - An arrival location
///   - A date
///   - A number of seats
/// The form can be created with an existing RidePref (optional).
///
/// When the form is submitted, the RideScreen is displayed.
class RidePrefForm extends StatefulWidget {
  final RidePref? initRidePref;

  const RidePrefForm({super.key, this.initRidePref});

  @override
  State<RidePrefForm> createState() => _RidePrefFormState();
}

class _RidePrefFormState extends State<RidePrefForm> {
  Location? departure;
  late DateTime departureDate;
  Location? arrival;
  late int requestedSeats;

  // ----------------------------------
  // Initialize the Form attributes
  // ----------------------------------

  @override
  void initState() {
    super.initState();
    final ridePref = widget.initRidePref;

    // if have values, set them
    if (ridePref != null) {
      departure = ridePref.departure;
      arrival = ridePref.arrival;
      departureDate = ridePref.departureDate;
      requestedSeats = ridePref.requestedSeats;

      // otherwise, set default values
    } else {
      departure = null;
      arrival = null;
      departureDate = DateTime.now();
      requestedSeats = 1;
    }
  }
  // ----------------------------------
  // Handle events
  // ----------------------------------

  // 1 - Handle the selection of the departure location
  void onDepartureSelected() async {
    Location? selectedLocation = await Navigator.of(context).push<Location>(
      AnimationUtils.createBottomToTopRoute(
        BlaLocationPicker(initLocation: departure),
      ),
    );
    // if a location is selected, update the state
    if (selectedLocation != null) {
      setState(() {
        departure = selectedLocation;
      });
    }
  }

  // 2 - Handle the selection of the arrival location
  void onArrivalSelected() async {
    final Location? selectedLocation = await Navigator.of(context).push(
      AnimationUtils.createBottomToTopRoute(
        BlaLocationPicker(initLocation: arrival),
      ),
    );
    if (selectedLocation != null) {
      setState(() {
        arrival = selectedLocation;
      });
    }
  }

  // 3 - Handle the form submission
  void onSubmit() {
    if (departure != null && arrival != null) {
      RidePref newRidePref = RidePref(
        departure: departure!,
        departureDate: departureDate,
        arrival: arrival!,
        requestedSeats: requestedSeats,
      );

      // navigate to the RideScreen
      Navigator.of(context).push(
        AnimationUtils.createBottomToTopRoute(
          RideScreen(initialRidePref: newRidePref), // Passing the RidePref
        ),
      );
    }
  }

  void onSwapLocations() {
    setState(() {
      Location? temp = departure;
      departure = arrival;
      arrival = temp;
    });
  }

  // ----------------------------------
  // Compute the widgets rendering
  // ----------------------------------
  String get departureName =>
      departure != null ? departure!.name : "Leaving from";

  bool get showDepartureInput => departure != null;
  bool get showArrivalInput => arrival != null;

  String get arrivalName => arrival != null ? arrival!.name : "Going to";

  String get departureDateLabel => DateTimeUtils.formatDateTime(departureDate);

  String get seatNumber => requestedSeats.toString();

  /// Enable swapping locations when both are set
  bool get swapEnabled => arrival != null && departure != null;

  // ----------------------------------
  // Build the widgets
  // ----------------------------------
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(BlaSpacings.m),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 1- Departure location
            RidePrefTile(
              isInput: showDepartureInput,
              title: departureName,
              iconLeft: Icons.departure_board_rounded,
              onTap: onDepartureSelected,
              iconRight: swapEnabled ? Icons.swap_vert : null,
              onRightTap: swapEnabled ? onSwapLocations : null,
            ),
            BlaDivider(),

            // 2- Arrival location
            RidePrefTile(
                isInput: showArrivalInput,
                title: arrivalName,
                iconLeft: Icons.share_arrival_time_rounded,
                onTap: onArrivalSelected),
            BlaDivider(),

            // 3- Departure date
            RidePrefTile(
                title: departureDateLabel,
                iconLeft: Icons.calendar_month_rounded,
                isInput: true,
                onTap: () {
                  // 1- Show the date picker
                  showDatePicker(
                    context: context,
                    initialDate: departureDate,
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(Duration(days: 365)),
                  ).then((DateTime? selectedDate) {
                    // 2- Update the state with the selected date
                    if (selectedDate != null) {
                      setState(() {
                        departureDate = selectedDate;
                      });
                    }
                  });
                }),
            BlaDivider(),

            // 4- Number of seats
            RidePrefTile(
                title: seatNumber,
                iconLeft: Icons.person_2_outlined,
                isInput: true,
                onTap: () {
                  // 1- Show the number picker
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Center(
                        child: SizedBox(
                          height: 200,
                          child: Column(
                            children: [
                              // 2- Number picker
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    tooltip: "Remove a seat",
                                    icon: Icon(Icons.remove),
                                    onPressed: () {
                                      setState(() {
                                        requestedSeats = (requestedSeats > 1)
                                            ? requestedSeats - 1
                                            : 1;
                                      });
                                    },
                                  ),
                                  // Display the number of seats
                                  Text(
                                    '$requestedSeats',
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  IconButton(
                                    tooltip: "Add a seat",
                                    icon: Icon(Icons.add),
                                    onPressed: () {
                                      setState(() {
                                        requestedSeats = (requestedSeats < 8)
                                            ? requestedSeats + 1
                                            : 8;
                                      });
                                    },
                                  ),
                                ],
                              ),

                              // 3- Done button
                              BlaButton(
                                text: "Done",
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                type: BlaButtonType.primary,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }),

            // 5- Search button
            BlaButton(
                text: "Search",
                onPressed: onSubmit,
                type: BlaButtonType.primary),
          ]),
    );
  }
}
