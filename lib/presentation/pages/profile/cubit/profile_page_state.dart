part of 'profile_page_cubit.dart';

final class ProfilePageState with EquatableMixin {
  const ProfilePageState({
    this.isBusy = false,
  });

  final bool isBusy;

  @override
  List<Object> get props => [];

  ProfilePageState copyWith({
    bool? isBusy,
  }) {
    return ProfilePageState(
      isBusy: isBusy ?? this.isBusy,
    );
  }
}

final class ProfilePageStateResponse<T> extends ProfilePageState {
  const ProfilePageStateResponse({
    required this.response,
  });

  final ResponseModel<T> response;

  @override
  List<Object> get props => [response];
}
