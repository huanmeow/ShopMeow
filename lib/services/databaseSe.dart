import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/account.dart'; // Import model Account

class DatabaseService {
  final CollectionReference _accountsCollection =
  FirebaseFirestore.instance.collection('accounts');

  Stream<List<Account>> getAccountList() {
    return _accountsCollection.snapshots().map((snapshot) => snapshot.docs
        .map((doc) => Account.fromFirestore(doc))
        .toList());
  }
  Future<List<Account>> searchAccounts(String keyword) async {
    // Tìm kiếm gần đúng theo username (ví dụ)
    QuerySnapshot snapshot = await _accountsCollection
        .where('username', isGreaterThanOrEqualTo: keyword)
        .where('username', isLessThan: keyword + 'z') // 'z' là ký tự cuối cùng trong bảng chữ cái
        .get();

    return snapshot.docs.map((doc) => Account.fromFirestore(doc)).toList();

// ... các hàm khác để tương tác với Firestore
}}