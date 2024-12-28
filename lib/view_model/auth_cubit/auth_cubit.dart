import 'package:al_gamal_al_massi/model/data_source/auth_data_source.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  final AuthRemoteDataSource _authRemoteDataSource = AuthRemoteDataSource();

  static AuthCubit get(context) => BlocProvider.of(context);

  void login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());
    final response = await _authRemoteDataSource.login(
      email: email,
      password: password,
    );
    response.fold(
      (error) {
        emit(
          LoginErrorState(error: error),
        );
      },
      (success) {
        emit(
          LoginSuccessState(userCredential: success),
        );
      },
    );
  }

  void register({
    required String email,
    required String password,
  }) async {
    emit(RegisterLoadingState());
    final response = await _authRemoteDataSource.register(
      email: email,
      password: password,
    );
    response.fold(
      (error) {
        emit(
          RegisterErrorState(error: error),
        );
      },
      (success) {
        emit(
          RegisterSuccessState(userCredential: success),
        );
      },
    );
  }

  void uploadUserIdAndEmailToFireStore({
    required UserCredential credentials,
    required String userName,
  }) async {
    try {
      await _authRemoteDataSource.uploadUserIdAndEmailToFireStore(
        credentials: credentials,
        userName: userName,
      );
      emit(
        UploadUserDataSuccess(
          userId: credentials.user?.uid ?? "",
          userName: userName,
        ),
      );
    } catch (error) {
      emit(UploadUserDataError(error: error.toString()));
    }
  }
}
