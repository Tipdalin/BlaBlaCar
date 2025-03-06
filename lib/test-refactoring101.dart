import 'service/locations_service.dart';
import 'repository/mock/MockLocationRepository.dart';

void main(){

  //1- Create the service
  LocationsService locationsService = LocationsService(repository: MockLocationsRepository());

  //2- Initialize the service
  locationsService.initialize(repository: MockLocationsRepository());

  //3- Get the locations
  print(getLocations(locationsService.repository));
}