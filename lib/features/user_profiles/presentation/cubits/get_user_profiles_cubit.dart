import 'package:bloc/bloc.dart';
import 'package:strichpunkt/features/user_profiles/domain/usecases/get_user_profile.dart';
import 'package:strichpunkt/features/user_profiles/presentation/cubits/get_user_profiles_state.dart';

class GetUserProfilesCubit extends Cubit<GetUserProfilesState> {
  final GetUserProfilesUsecase usecase;
  GetUserProfilesCubit(this.usecase) : super(GetUserProfilesState.initial());

  Future<void> getUserProfiles() async {
    emit(state.copyWith(isLoading: true));
    final result = await usecase.call();
    result.fold(
      (failure) => emit(
        state.copyWith(
          isError: true,
          message: failure.message,
          isLoading: false,
          profiles: [],
        ),
      ),
      (profiles) => emit(
        state.copyWith(
          profiles: profiles,
          isLoading: false,
          isError: false,
          message: '',
        ),
      ),
    );
  }
}
