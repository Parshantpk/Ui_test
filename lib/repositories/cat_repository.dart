import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ui_test/model/profile_model.dart';

import '../../model/cat_model.dart';
import 'base_cat_repository.dart';

class CatRepository extends BaseCatRepository {
  final FirebaseFirestore _firebaseFirestore;

  CatRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<Cat>> getAllCats() {
    return _firebaseFirestore.collection('cats').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Cat.fromSnapShot(doc)).toList();
    });
  }

  @override
  Stream<List<Cat>> getFeaturedCats() {
    return _firebaseFirestore
        .collection('featured')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Cat.fromSnapShot(doc)).toList();
    });
  }

  @override
  Stream<List<Cat>> getMyCats() {
    return _firebaseFirestore.collection('mycats').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Cat.fromSnapShot(doc)).toList();
    });
  }

  @override
  Stream<List<Profile>> getProfile() {
    return _firebaseFirestore
        .collection('profile')
        .where('COngIb6U0tbaDs3LVQGt')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Profile.fromSnapShot(doc)).toList();
    });
  }

  Future<void> addFromAllCat({
    required String title,
    required String image,
    required String description,
    required bool buttonState,
    required int index,
  }) async {
    String docId = await getAllCatDocId(index);
    await _firebaseFirestore.collection('mycats').doc(docId).set({
      'title': title,
      'image': image,
      'description': description,
      'button_state': false,
    });
    await _firebaseFirestore
        .collection('cats')
        .doc(docId)
        .update({'button_state': false});
  }

  Future<void> addFromFeaturedCat({
    required String title,
    required String image,
    required String description,
    required bool buttonState,
    required int index,
  }) async {
    String docId = await getFeaturedCatDocId(index);
    await _firebaseFirestore.collection('mycats').doc(docId).set({
      'title': title,
      'image': image,
      'description': description,
      'button_state': false,
    });
    await _firebaseFirestore
        .collection('featured')
        .doc(docId)
        .update({'button_state': false});
  }

  Future<void> removeCatOnCatBlocAllCatsEvent({
    required int index,
  }) async {
    String allCatsDocId = await getAllCatDocId(index);
    await _firebaseFirestore
        .collection('cats')
        .doc(allCatsDocId)
        .update({'button_state': true});
    await _firebaseFirestore.collection('mycats').doc(allCatsDocId).delete();
  }

  Future<void> removeCatOnCatBlocFeaturedCatEvent({
    required int index,
  }) async {
    String featuredCatsDocId = await getFeaturedCatDocId(index);
    await _firebaseFirestore
        .collection('featured')
        .doc(featuredCatsDocId)
        .update({'button_state': true});
    await _firebaseFirestore
        .collection('mycats')
        .doc(featuredCatsDocId)
        .delete();
  }

  Future<void> removeCatOnMeBlocEvent({
    required int index,
  }) async {
    String docId = await getMyCatDocId(index);
    var allCatsDoc =
        await _firebaseFirestore.collection('cats').doc(docId).get();
    var featuredCatsDoc =
        await _firebaseFirestore.collection('featured').doc(docId).get();

    if (featuredCatsDoc.data() != null) {
      print('featuredCatsDoc: ${featuredCatsDoc.data()}');
      await _firebaseFirestore
          .collection('featured')
          .doc(docId)
          .update({'button_state': true});
    }
    if (allCatsDoc.data() != null) {
      print('allCatsDoc: ${allCatsDoc.id}');
      await _firebaseFirestore
          .collection('cats')
          .doc(docId)
          .update({'button_state': true});
    }

    await _firebaseFirestore.collection('mycats').doc(docId).delete();
  }

  Future<String> getMyCatDocId(int index) async {
    String docId = '';
    await _firebaseFirestore.collection('mycats').get().then((event) {
      docId = event.docs[index].id;
      print(event.docs[index].id);
    });
    return docId;
  }

  Future<String> getFeaturedCatDocId(int index) async {
    String docId = '';
    await _firebaseFirestore.collection('featured').get().then((event) {
      docId = event.docs[index].id;
      print(event.docs[index].id);
    });
    return docId;
  }

  Future<String> getAllCatDocId(int index) async {
    String docId = '';
    await _firebaseFirestore.collection('cats').get().then((event) {
      docId = event.docs[index].id;
      print(event.docs[index].id);
    });
    return docId;
  }
}
