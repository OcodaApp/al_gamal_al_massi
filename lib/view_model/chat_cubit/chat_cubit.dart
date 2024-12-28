import 'package:al_gamal_al_massi/core/cache_helper/shared_pref_methods.dart';
import 'package:al_gamal_al_massi/model/data_source/chat_data_source.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

  final ChatsRemoteDataSource _chatsRemoteDataSource = ChatsRemoteDataSource();

  static ChatCubit get(context) => BlocProvider.of(context);

  Future<void> sendMessage({
    required String receiverId,
    required String message,
  }) async {
    emit(SendMessageLoading());
    try {
      await _chatsRemoteDataSource.sendMessage(
        senderId: CacheHelper.getData(key: "userId"),
        receiverId: receiverId,
        message: message,
      );

      emit(SendMessageSuccess());
    } catch (e) {
      emit(SendMessageError());
    }
  }

  Stream<List<Map<String, dynamic>>> getUsers() {
    return _chatsRemoteDataSource.getUsers();
  }

  Stream<List<Map<String, dynamic>>> getChatMessages({
    required String receiverId,
  }) {
    return _chatsRemoteDataSource.getChats(
      senderId: CacheHelper.getData(key: "userId"),
      receiverId: receiverId,
    );
  }
}
