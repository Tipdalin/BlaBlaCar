import 'package:week_3_blabla_project/model/ride_pref/ride_pref.dart';
import 'package:week_3_blabla_project/service/rides_service.dart';
import '../model/ride/ride.dart';

abstract class RidesRepository {
  List<Ride> getRides(RidePref preference, RidesFilter? filter);
}
