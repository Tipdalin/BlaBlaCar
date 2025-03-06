import 'package:week_3_blabla_project/repository/mock/MockRidesRepository.dart';
import 'package:week_3_blabla_project/service/rides_service.dart';

import 'service/locations_service.dart';
import 'repository/mock/MockLocationRepository.dart';

void main(dynamic acceptPets) {
  // Create
  LocationsService locationsService =
      LocationsService(repository: MockLocationsRepository());
  MockRidesRepository mockrepo = MockRidesRepository();

  //Set up rides service
  RidesService.initialize(mockrepo);
  locationsService.initialize(repository: MockLocationsRepository());

  //Search for rides
  RidesFilter filter = RidesFilter(acceptPets: true);

  // Get the locations
  print(getLocations(locationsService.repository));
  print(getLocations(RidesFilter(acceptPets: acceptPets)));
  print(getLocations(RidesService(repository: MockRidesRepository())));
}
