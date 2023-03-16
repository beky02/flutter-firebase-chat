import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_chat/bloc/chat_bloc/chat_event.dart';
import 'package:firebase_chat/bloc/chat_bloc/chat_state.dart';
import 'package:firebase_chat/resources/firestore_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  FirestoreService _firestoreService ;
  ChatBloc() : super(InitialChatState()) {
     _firestoreService = FirestoreService();
    
    _firestoreService.chatStreem.listen((event) {
      print("received messages");
      print(event);
    });
  }

  @override
  Stream<ChatState> mapEventToState(ChatEvent event) async* {}
}
