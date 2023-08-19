part of send_message_cubit;

class SendMessageBloc extends Cubit<SendMessageState> {
  //final SocketConnection _socketConnection = SocketConnection();
  SendMessageBloc() : super(SendMessageInitialState()) {
    // _socketConnection.sendMessageBlocStreem.listen((event) {
    //   if (event.containsKey('send-message-response')) {
    //     add(SendNewMessageSuccessfulEvent(event['send-message-response']));
    //   } else {
    //     add(NewMessageArrivedEvent(event['new-message']));
    //   }
    // });
  }

  Future<void> sendMessage() async {}
}
