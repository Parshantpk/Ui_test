import 'package:ui_test/model/cat_model.dart';
import 'package:ui_test/model/profile_model.dart';

abstract class BaseCatRepository {
  Stream<List<Cat>> getFeaturedCats();
  Stream<List<Cat>> getAllCats();
  Stream<List<Cat>> getMyCats();
  Stream<List<Profile>> getProfile();
}
