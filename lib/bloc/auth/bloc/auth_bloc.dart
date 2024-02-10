import 'package:bloc/bloc.dart';
import 'package:coinless/model/login-model.dart';
import 'package:coinless/model/sign-up.dart';
import 'package:coinless/model/user-model.dart';
import 'package:coinless/service/auth-service.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is AuthLogin) {
        try {
          emit(AuthLoading());

          final user = await AuthService().login(event.data);
          emit(AuthSuccess(user));
        } catch (e) {
          emit(
            AuthFailed(
              e.toString(),
            ),
          );
        }
      }
      if (event is Authregister) {
        try {
          emit(AuthLoading());

          final user = await AuthService().register(event.data);
          emit(AuthSuccess(user));
        } catch (e) {
          emit(
            AuthFailed(
              e.toString(),
            ),
          );
        }
      }
    });
  }
}
