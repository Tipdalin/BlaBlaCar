import '../../model/ride/locations.dart';
import '../LocationRepository.dart';

class MockLocationsRepository extends LocationRepository{
  final Location PhnomPenh = Location(name: "Phnom Penh", country: Country.cambodia);
  final Location SiemReap = Location(name: "Siem Reap", country: Country.cambodia);
  final Location Battambang = Location(name: "Battambang", country: Country.cambodia);
  final Location Sihanoukville = Location(name: "Sihanoukville", country: Country.cambodia);
  final Location Kampot = Location(name: "Kampot", country: Country.cambodia);
  @override
  List<Location> getLocations() {
    return [
      PhnomPenh, 
      SiemReap, 
      Battambang, 
      Sihanoukville, 
      Kampot
      ];
  }
}