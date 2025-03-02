import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/model/ride/locations.dart';
import 'package:week_3_blabla_project/theme/theme.dart';
import '../../service/locations_service.dart';

class BlaLocationPicker extends StatefulWidget {
  final Location? initLocation;
  const BlaLocationPicker({super.key, this.initLocation});

  @override
  State<BlaLocationPicker> createState() => _BlaLocationPickerState();
}

class _BlaLocationPickerState extends State<BlaLocationPicker> {
  List<Location> filteredLocations = [];

  // 1- Initialize the state
  @override
  void initState() {
    super.initState();
    filteredLocations = [];
  }

  // 2- When the search text changes, update the filtered locations
  void onSearchChanged(String query) {
    setState(() {
      filteredLocations = query.isEmpty
          ? LocationsService.availableLocations
          : LocationsService.availableLocations
              .where((location) =>
                  location.name.toLowerCase().contains(query.toLowerCase()))
              .toList();
    });
  }

  // Navigate back to the previous screen
  void onBackSelected() {
    Navigator.of(context).pop();
  }

  // Back to the previous screen after selecting a location
  void onLocationSelected(Location location) {
    Navigator.of(context).pop(location);
  }

  // Get the locations
  List<Location> getLocationsFor(String text) {
    return LocationsService.availableLocations
        .where((location) =>
            location.name.toLowerCase().contains(text.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
            left: BlaSpacings.l, right: BlaSpacings.l, top: BlaSpacings.l),
        child: Column(
          children: [
            /// 1- Search bar
            BlaSearchBar(
              onBackPressed: onBackSelected,
              onSearchChanged: onSearchChanged,
            ),

            /// 2- Locations list
            Expanded(
              child: ListView.builder(
                itemCount: filteredLocations.length,
                itemBuilder: (ctx, index) => LocationTile(
                  location: filteredLocations[index],
                  onSelected: onLocationSelected,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//LocationTile
class LocationTile extends StatelessWidget {
  final Location location;
  final Function(Location) onSelected;

  const LocationTile(
      {super.key, required this.location, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(location.name),
      subtitle: Text(location.country.name),
      onTap: () => onSelected(location),
    );
  }
}

//BlaSearchBar
class BlaSearchBar extends StatefulWidget {
  final Function(String text) onSearchChanged;
  final VoidCallback onBackPressed;

  const BlaSearchBar({
    super.key,
    required this.onSearchChanged,
    required this.onBackPressed,
  });

  @override
  State<BlaSearchBar> createState() => _BlaSearchBarState();
}

class _BlaSearchBarState extends State<BlaSearchBar> {
  // 1-Manage the text field
  final TextEditingController _controller = TextEditingController();

  // 2- Check if the search bar is empty
  bool get searchIsNotEmpty => _controller.text.isNotEmpty;

  // 3- Dispose the controller
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: BlaColors.backgroundAccent,
        borderRadius: BorderRadius.circular(BlaSpacings.radius),
      ),
      child: Row(
        children: [
          /// 1- Back button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: IconButton(
              onPressed: widget.onBackPressed,
              icon:
                  Icon(Icons.arrow_back, color: BlaColors.iconNormal, size: 25),
            ),
          ),

          /// 2- Search bar
          Expanded(
            child: TextField(
              onChanged: widget.onSearchChanged,
              controller: _controller,
              decoration: InputDecoration(
                hintText: "Search",
                hintStyle: TextStyle(color: BlaColors.textLight),
                border: InputBorder.none,
                filled: false,
              ),
            ),
          ),

          /// 3- Clear button
          if (searchIsNotEmpty)
            IconButton(
              onPressed: () {
                _controller.clear();
                widget.onSearchChanged("");
              },
              icon: const Icon(Icons.clear),
            ),
        ],
      ),
    );
  }
}
