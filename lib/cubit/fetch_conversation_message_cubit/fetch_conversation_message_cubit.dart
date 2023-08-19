part of fetch_converstion_message_cubit;

class FetchConversationMessageCubit
    extends Cubit<FetchConversationMessageState> {
  late FirestoreService _firestoreService;
  FetchConversationMessageCubit() : super(InitialChatState()) {
    _firestoreService = FirestoreService();

    _firestoreService.chatStreem.listen((event) {
      print("received messages");
      print(event);
    });
  }
}
