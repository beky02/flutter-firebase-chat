import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_chat/models/index.dart';

class ConversationService {
  ConversationService();

  // Retrieve all conversations for the user.
  Future<List<ConversationModel>> getConversations(
      {required String uid}) async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
        .instance
        .collection('conversation')
        .where('members', arrayContains: uid)
        .get();

    return querySnapshot.docs
        .map((conversationDoc) => ConversationModel(
              user: UserModel(
                  id: 'hjahdk2',
                  firstName: 'Bereket',
                  lastName: 'Tadege',
                  phoneNumber: "0911223344",
                  userName: '@beky',
                  createdAt: DateTime.now()),
              connectionId: conversationDoc.id,
              lastMessage: conversationDoc.data()['last_message'],
              lastMessageTime:
                  (conversationDoc.data()['last_message_time'] as Timestamp)
                      .toDate(),
            ))
        .toList();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> listenToConversations(
      {required String uid}) {
    return FirebaseFirestore.instance
        .collection('conversations')
        .where('members', arrayContains: uid)
        .snapshots();
  }
}
