part of fetch_converstion_cubit;

class FetchConversationCubit extends Cubit<FetchConversationState> {
  final ConversationService _conversationService;
  FetchConversationCubit({required ConversationService conversationService})
      : _conversationService = conversationService,
        super(InitialFetchConversationState()) {}

  List<ConversationModel> conversations = [];

  Future<void> getAllConversation() async {
    emit(FetchingConversations());

    try {
      List<ConversationModel> conversation =
          await _conversationService.getConversations(uid: 'uuid1');

      conversations = conversation;
      emit(ConversationsFetched());
    } catch (e) {
      emit(FetchingConversationsFailed());
    }
  }
}
