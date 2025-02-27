import 'package:cloud_firestore/cloud_firestore.dart';

class FavoriteManager {
  final CollectionReference _favoritesCollection =
  FirebaseFirestore.instance.collection('favorites'); // Thay 'favorites' bằng tên collection của bạn

  Future<void> addFavorite(String userId, String productId) async {
    await _favoritesCollection.doc(userId).collection('products').doc(productId).set({});
  }

  Future<void> removeFavorite(String userId, String productId) async {
    await _favoritesCollection.doc(userId).collection('products').doc(productId).delete();
  }

  Future<bool> isFavorite(String userId, String productId) async {
    final doc = await _favoritesCollection
        .doc(userId)
        .collection('products')
        .doc(productId)
        .get();
    return doc.exists;
  }

  Stream<List<String>> getFavoriteProducts(String userId) {
    return _favoritesCollection
        .doc(userId)
        .collection('products')
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => doc.id).toList());
  }
}