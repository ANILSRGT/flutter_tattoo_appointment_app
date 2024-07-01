import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tattoo_appointment/domain/usecases/auth/auth_sign_out_usecase.dart';
import 'package:tattoo_appointment/injection.dart';

part 'profile_page_state.dart';

class ProfilePageCubit extends Cubit<ProfilePageState> {
  ProfilePageCubit() : super(const ProfilePageState());

  void changePageState({required bool isBusy}) {
    emit(state.copyWith(isBusy: isBusy));
  }

  Future<void> logout() async {
    final res = await Injection.read<AuthSignOutUseCase>().execute();
    emit(ProfilePageStateResponse(response: res));
  }
}
