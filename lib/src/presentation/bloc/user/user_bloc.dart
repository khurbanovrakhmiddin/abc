import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entity/user_entity.dart';
import '../../../domain/usecase/profile/get_profile_usecase.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUserProfileUseCase getUserProfileUseCase;

  UserBloc(this.getUserProfileUseCase) : super(UserInitial()) {
    on<LoadUserProfile>((event, emit) async {
      emit(UserLoading());

      final result = await getUserProfileUseCase();

      result.fold(
        (failure) => emit(UserError(failure.message)),
        (user) => emit(UserLoaded(user)),
      );
    });
  }
}
