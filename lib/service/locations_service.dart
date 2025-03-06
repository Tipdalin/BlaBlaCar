import 'package:week_3_blabla_project/model/ride/locations.dart';
import 'package:week_3_blabla_project/repository/mock/MockLocationRepository.dart';

import '../dummy_data/dummy_data.dart';
import '../repository/LocationRepository.dart';

////
///   This service handles:
///   - The list of available rides
///
class LocationsService {
  final LocationRepository repository;
  static const List<Location> availableLocations = fakeLocations;   // TODO for now fake data
  static LocationsService? _instance;

  LocationsService({required this.repository});

  static LocationsService get instance {
    if (_instance == null) {
      throw Exception("The service is not ititialized Please run intialize first");
    }
    return _instance!;
  }
void initialize({
    required MockLocationsRepository repository,
}) {
    
}
}

  List<Location> getLocations(repository) {
    return repository.getLocations();
  }