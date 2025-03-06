import 'package:week_3_blabla_project/model/ride_pref/ride_pref.dart';
import 'package:week_3_blabla_project/repository/RidesRepository.dart';
import 'package:week_3_blabla_project/repository/mock/MockRidesRepository.dart';
import '../dummy_data/dummy_data.dart';
import '../model/ride/ride.dart';

///   This service handles:
///   - The list of available rides
class RidesService {
  static List<Ride> availableRides = fakeRides;

  static RidesService? _instance;
  final RidesRepository repository;

  RidesService({required this.repository});

  RidesService._internal(this.repository);

  static void initialize(RidesRepository repository) {
    _instance ??= RidesService._internal(repository);
  }

  static RidesService get instance{
    _instance ??= RidesService._internal(MockRidesRepository());
    return _instance!;
  }

  // Fetches a list of rides based on user preferences and an optional filter.
  // Calls the `_repository` to retrieve data.
  List<Ride> getRides(RidePref preference, RidesFilter? filter) {
    return repository.getRides(preference, filter);
  }

  ///  Return the relevant rides, given the passenger preferences

  static List<Ride> getRidesFor(RidePref preferences) {
      print(availableRides);

    return availableRides
        .where((ride) =>
            ride.departureLocation == preferences.departure &&
            ride.arrivalLocation == preferences.arrival)
        .toList();
  }
}

class RidesFilter {
  final bool acceptPets;

  RidesFilter({required this.acceptPets});
}
