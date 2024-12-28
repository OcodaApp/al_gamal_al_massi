import 'package:cloud_firestore/cloud_firestore.dart';

class ChatsRemoteDataSource {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<void> sendMessage({
    required String senderId,
    required String receiverId,
    required String message,
  }) async {
    try {
      final senderPath = firebaseFirestore
          .collection("users")
          .doc(senderId)
          .collection("chats")
          .doc(receiverId)
          .collection("messages");

      final receiverPath = firebaseFirestore
          .collection("users")
          .doc(receiverId)
          .collection("chats")
          .doc(senderId)
          .collection("messages");

      final messageData = {
        "message": message,
        "dateTime": DateTime.now().toIso8601String(),
        "receiverId": receiverId,
        "senderId": senderId,
      };
      await senderPath.add(messageData);
      await receiverPath.add(messageData);
    } catch (e) {
      rethrow;
    }
  }

  Stream<List<Map<String, dynamic>>> getChats({
    required String senderId,
    required String receiverId,
  }) {
    return firebaseFirestore
        .collection("users")
        .doc(senderId)
        .collection("chats")
        .doc(receiverId)
        .collection("messages")
        .orderBy("dateTime")
        .snapshots()
        .map((query) => query.docs.map((message) => message.data()).toList());
  }

  Stream<List<Map<String, dynamic>>> getUsers() {
    return firebaseFirestore
        .collection("users")
        .snapshots()
        .map((query) => query.docs.map((message) => message.data()).toList());
  }
}
