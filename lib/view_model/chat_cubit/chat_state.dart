part of 'chat_cubit.dart';

sealed class ChatState {}

final class ChatInitial extends ChatState {}

final class Loading extends ChatState {}
final class Success extends ChatState {}
final class Error extends ChatState {}

final class SendMessageLoading extends ChatState {}
final class SendMessageSuccess extends ChatState {}
final class SendMessageError extends ChatState {}
final class GetUsers extends ChatState {}
