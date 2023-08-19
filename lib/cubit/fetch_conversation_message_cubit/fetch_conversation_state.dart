part of fetch_converstion_cubit;

abstract class FetchConversationState {}

class InitialFetchConversationState extends FetchConversationState {}

class FetchingConversations extends FetchConversationState {}

class FetchingConversationsFailed extends FetchConversationState {}

class ConversationsFetched extends FetchConversationState {}
