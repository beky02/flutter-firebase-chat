import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_chat/models/index.dart';
import 'package:flutter/services.dart';

class FirestoreService {
  FirestoreService() {
    listenToMessageRealTime(FirebaseAuth.instance.currentUser?.uid ?? "");
  }
  final CollectionReference _usersCollectionReference =
      FirebaseFirestore.instance.collection('users');
  final CollectionReference _chatCollectionReference =
      FirebaseFirestore.instance.collection('chat');

  final StreamController<List<MessageModel>> _chatContoller =
      StreamController<List<MessageModel>>.broadcast();
  Stream<List<MessageModel>> get chatStreem => _chatContoller.stream;

  Future createUser(UserModel user) async {
    try {
      await _usersCollectionReference.doc(user.id).set(user.toJson());
    } catch (e) {
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }

  Future sendMessage(MessageModel message) async {
    try {
      if (message.connectionId == null) {
        await _chatCollectionReference
            .doc(message.senderId + message.receiverId)
            .collection("messages")
            .doc()
            .set(message.toJson());
      } else {
        await _chatCollectionReference
            .doc(message.connectionId)
            .collection("messages")
            .doc()
            .set(message.toJson());
      }
    } catch (e) {
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }

  listenToMessageRealTime(String currentUserId) {
    print("called");
    _chatContoller.sink.add([
      MessageModel(
          id: '12345',
          receiverId: "2",
          text: "kal",
          connectionId: '12',
          senderId: '1',
          seen: false)
    ]);
    _chatCollectionReference.snapshots().listen((event) {
      // print(currentUserId);
      // print(event.docs[1].data());
      if (event.docs.isNotEmpty) {
        var messages = event.docs
            .map((e) {
              print("check message");
              print(e.data());
              return MessageModel.fromJson(e.data() as Map<String, dynamic>);
            })
            .where((element) => element.receiverId == currentUserId)
            .toList();

        _chatContoller.sink.add(messages);
      }
    });
  }

  Future getAllUsers() async {
    try {
      var usersDocumentSnapshot = await _usersCollectionReference.get();
      print(usersDocumentSnapshot.docs);
      if (usersDocumentSnapshot.docs.isNotEmpty) {
        return usersDocumentSnapshot.docs
            .map((e) => UserModel.fromJson(e.data() as Map<String, dynamic>))
            .toList();
      }
    } catch (e) {
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }

  void printName() {
    print("hello");
  }
}
