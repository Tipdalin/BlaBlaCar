import 'package:week_3_blabla_project/model/ride/locations.dart';
import 'package:week_3_blabla_project/model/ride/ride.dart';
import 'package:week_3_blabla_project/model/ride_pref/ride_pref.dart';
import 'package:week_3_blabla_project/model/user/user.dart';
import 'package:week_3_blabla_project/repository/RidesRepository.dart';
import 'package:week_3_blabla_project/service/rides_service.dart';

class MockRidesRepository extends RidesRepository {
  DateTime time = DateTime.now();
  late Ride ride1, ride2, ride3, ride4, ride5;

  MockRidesRepository() {
    ride1 = Ride(
      departureLocation:
          Location(name: 'Battambang', country: Country.cambodia),
      arrivalLocation: Location(name: 'Siem Reap', country: Country.cambodia),
      departureDate: DateTime(time.year, time.month, time.day, 5, 30),
      arrivalDateTime: DateTime(time.year, time.month, time.day, 7, 30),
      duration: 2,
      driver: User(
        firstName: 'Kannika',
        lastName: '',
        email: 'Kannika@gmail.com',
        phone: '123456',
        profilePicture: '',
        verifiedProfile: false,
      ),
      availableSeats: 2,
      pricePerSeat: 25.0,
      acceptPets: false,
    );
    ride2 = Ride(
      departureLocation:
          Location(name: 'Battambang', country: Country.cambodia),
      arrivalLocation: Location(name: 'Siem Reap', country: Country.cambodia),
      departureDate: DateTime(time.year, time.month, time.day, 8, 0),
      arrivalDateTime: DateTime(time.year, time.month, time.day, 10, 0),
      duration: 2,
      driver: User(
        firstName: "Chaylim",
        lastName: '',
        email: 'Chaylim@gmgail.com',
        phone: '0987654321',
        profilePicture: '',
        verifiedProfile: false,
      ),
      availableSeats: 0,
      pricePerSeat: 25.0,
      acceptPets: false,
    );

    ride3 = Ride(
      departureLocation:
          Location(name: 'Battambang', country: Country.cambodia),
      arrivalLocation: Location(name: 'Siem Reap', country: Country.cambodia),
      departureDate: DateTime(time.year, time.month, time.day, 5, 0),
      arrivalDateTime: DateTime(time.year, time.month, time.day, 8, 0),
      duration: 3,
      driver: User(
        firstName: "Mengtech",
        lastName: '',
        email: 'Mengtech@gmail.com',
        phone: '0121324544',
        profilePicture: '',
        verifiedProfile: false,
      ),
      availableSeats: 1,
      pricePerSeat: 25.0,
      acceptPets: false,
    );

    ride4 = Ride(
      departureLocation:
          Location(name: 'Battambang', country: Country.cambodia),
      arrivalLocation: Location(name: 'Siem Reap', country: Country.cambodia),
      departureDate: DateTime(time.year, time.month, time.day, 8, 0),
      arrivalDateTime: DateTime(time.year, time.month, time.day, 10, 0),
      duration: 2,
      driver: User(
        firstName: "Limhao",
        lastName: '',
        email: 'Limhao@gmail.com',
        phone: '0124329434',
        profilePicture: '',
        verifiedProfile: false,
      ),
      availableSeats: 2,
      pricePerSeat: 25.0,
      acceptPets: true,
    );

    ride5 = Ride(
      departureLocation:
          Location(name: 'Battambang', country: Country.cambodia),
      arrivalLocation: Location(name: 'Siem Reap', country: Country.cambodia),
      departureDate: DateTime(time.year, time.month, time.day, 5, 0),
      arrivalDateTime: DateTime(time.year, time.month, time.day, 8, 0),
      duration: 3,
      driver: User(
        firstName: "Sovanda",
        lastName: '',
        email: 'Sovanda@gmail.com',
        phone: '354656534',
        profilePicture: '',
        verifiedProfile: false,
      ),
      availableSeats: 1,
      pricePerSeat: 25.0,
      acceptPets: false,
    );
  }
  @override
  List<Ride> getRides(RidePref preference, RidesFilter? filter) {
    List<Ride> rides = [
      ride1,
      ride2,
      ride3,
      ride4,
      ride5
    ];
    return rides
        .where((ride) =>
            ride.departureLocation.name == preference.departure.name &&
            ride.arrivalLocation.name == preference.arrival &&
            ride.departureDate.isAfter(preference.departureDate) &&
            ride.availableSeats >= preference.requestedSeats &&
            (filter == null || filter.acceptPets == ride.acceptPets))
        .toList();
  }
}
