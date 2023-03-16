

import 'package:firebase_chat/models/conversation_model.dart';
import 'package:firebase_chat/models/message_model.dart';

abstract class SendMessageState {}

class SendMessageInitialState extends SendMessageState {}

class SendMessageSuccessfulState extends SendMessageState {
  final ConversationModel message;
  SendMessageSuccessfulState(this.message);
}

class SendMessageFailedState extends SendMessageState {}

class SendMessageLoadingState extends SendMessageState {}
class NewMessageArrivedState extends SendMessageState {
  final MessageModel message;

  NewMessageArrivedState(this.message);
}