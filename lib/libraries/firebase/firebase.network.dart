import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class FbNetwork {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  static Future<void> insertOrUpdateDocument({
    @required String collectionName,
    @required String docId,
    @required Map<String, dynamic> data,
  }) async {
    DocumentReference firestoreDocument =
        firestore.collection(collectionName).doc(docId);
    await firestoreDocument.set(data);
  }

  static Future<List<QueryDocumentSnapshot>> getListDocuments(
    String collectionName,
  ) async {
    List<QueryDocumentSnapshot> documents = [];
    QuerySnapshot collection;
    CollectionReference firestoreCollection =
        firestore.collection(collectionName);
    collection = await firestoreCollection.get();
    documents = collection.docs;
    return documents;
  }

  static Future<Map<String, dynamic>> getDocument({
    @required String collectionName,
    @required String docId,
  }) async {
    CollectionReference firestoreCollection =
        firestore.collection(collectionName);

    DocumentSnapshot snapshot = await firestoreCollection.doc(docId).get();

    return snapshot.data();
  }

  static Future<void> deleteDocument({
    @required String docId,
    @required String collectionName,
  }) async {
    DocumentReference firestoreCollection =
        firestore.collection(collectionName).doc(docId);
    firestoreCollection.delete();
  }
}
