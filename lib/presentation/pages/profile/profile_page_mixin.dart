part of 'profile_page.dart';

mixin ProfilePageMixin on State<ProfilePage> {
  final ProfilePageCubit _profilePageCubit = ProfilePageCubit();

  Future<void> _onLogout() async {
    _profilePageCubit.changePageState(isBusy: true);
    await _profilePageCubit.logout();
  }
}
