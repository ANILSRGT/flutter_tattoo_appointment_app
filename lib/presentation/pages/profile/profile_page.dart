import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:tattoo_appointment/core/constants/localization/local_keys.g.dart';
import 'package:tattoo_appointment/core/extensions/context/context_ext.dart';
import 'package:tattoo_appointment/core/extensions/string/string_ext.dart';
import 'package:tattoo_appointment/presentation/pages/profile/cubit/profile_page_cubit.dart';
import 'package:tattoo_appointment/presentation/pages/profile/widgets/profile_editable_info.dart';
import 'package:tattoo_appointment/presentation/widgets/avatar/profile_avatar.dart';
import 'package:tattoo_appointment/presentation/widgets/cover/profile_cover.dart';
import 'package:tattoo_appointment/presentation/widgets/navigation_button/nav_back_button.dart';

part 'profile_page_mixin.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with ProfilePageMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody,
    );
  }

  Widget get _buildBody {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 600,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader,
            context.ext.sizedBox.height.md,
            Padding(
              padding: context.ext.padding.horizontal.md,
              child: _buildProfileEditableInfos,
            ),
            context.ext.sizedBox.height.md,
          ],
        ),
      ),
    );
  }

  Widget get _buildHeader {
    return LayoutBuilder(
      builder: (_, cst) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _profileHead(cst.maxWidth),
            context.ext.sizedBox.height.md,
            _buildProfileDetails,
            context.ext.sizedBox.height.md,
            _buildProfileActions,
          ],
        );
      },
    );
  }

  Widget _profileHead(double maxWidth) {
    const coverRatio = 820 / 312;
    final avatarSize = (maxWidth * 820 / 312) * 0.045;
    return Stack(
      children: [
        Column(
          children: [
            Stack(
              children: [
                _profileCover(coverRatio),
                if (Navigator.canPop(context))
                  Positioned(
                    top: context.ext.values.md,
                    left: context.ext.values.md,
                    child: _profileHeaderBackButton,
                  ),
                Positioned(
                  top: context.ext.values.md,
                  right: context.ext.values.md,
                  child: _profileHeaderFavoriteButton,
                ),
              ],
            ),
            SizedBox(height: avatarSize),
          ],
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: _profileAvatar(avatarSize),
        ),
      ],
    );
  }

  Widget _profileCover(double coverRatio) {
    return ProfileCover(
      coverImage: NetworkImage(''.ext.random.imageLandscape),
    );
  }

  Widget get _profileHeaderBackButton {
    return NavBackButton(
      foregroundColor: context.extApp.theme.currentThemeColor.primary.onColor,
      backgroundColor: context.extApp.theme.currentThemeColor.primary.color,
      iconSize: context.ext.values.lg,
    );
  }

  Widget get _profileHeaderFavoriteButton {
    return CircleAvatar(
      radius: context.ext.values.xl,
      backgroundColor: context.extApp.theme.currentThemeColor.primary.color,
      foregroundColor: context.extApp.theme.currentThemeColor.primary.onColor,
      child: Icon(
        Icons.favorite_rounded,
        size: context.ext.values.xl,
      ),
    );
  }

  Widget _profileAvatar(double avatarSize) {
    return ProfileAvatar(
      avatarSize: avatarSize,
      userPhoto: NetworkImage(''.ext.random.imageSquare),
    );
  }

  Widget get _buildProfileDetails {
    return Padding(
      padding: context.ext.padding.horizontal.md,
      child: Column(
        children: [
          _profileUserFullName,
          context.ext.sizedBox.height.xs,
          _profileBio,
        ],
      ),
    );
  }

  Widget get _profileUserFullName {
    return Text(
      'John Doe',
      textAlign: TextAlign.center,
      maxLines: 1,
      style: context.ext.theme.textTheme.titleLarge?.copyWith(
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget get _profileBio {
    return Text(
      'Blogger, Photographer, Designer',
      textAlign: TextAlign.center,
      overflow: TextOverflow.visible,
      style: context.ext.theme.textTheme.bodyMedium?.copyWith(
        color: context.extApp.theme.currentThemeColor.grey.color,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget get _buildProfileActions {
    return Row(
      children: [
        context.ext.sizedBox.width.sm,
        Expanded(child: _profileEditButton),
        context.ext.sizedBox.width.sm,
      ],
    );
  }

  Widget get _profileEditButton {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: context.extApp.theme.currentThemeColor.tertiary.color,
        foregroundColor:
            context.extApp.theme.currentThemeColor.tertiary.onColor,
      ),
      child: Text(LocalKeys.pagesProfileEditProfileButton.appExt.locale.toTr),
    );
  }

  Widget get _buildProfileEditableInfos {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _editableInfoBirthDate,
        context.ext.sizedBox.height.sm,
        _editableInfoGender,
        context.ext.sizedBox.height.sm,
        _editableInfoEmail,
        context.ext.sizedBox.height.sm,
        _editableInfoPhone,
        context.ext.sizedBox.height.sm,
        _editableInfoChangePassword,
        context.ext.sizedBox.height.xl,
        _editableInfoLogOut,
      ],
    );
  }

  Widget get _editableInfoBirthDate {
    return ProfileEditableInfo(
      icon: const Icon(Icons.cake_rounded),
      content: '1990-01-01',
      onEdit: () {},
    );
  }

  Widget get _editableInfoEmail {
    return ProfileEditableInfo(
      icon: const Icon(Icons.email_rounded),
      content: 'email@email.com',
      onEdit: () {},
    );
  }

  Widget get _editableInfoPhone {
    return ProfileEditableInfo(
      icon: const Icon(Icons.phone_rounded),
      content: '+1234567890',
      onEdit: () {},
    );
  }

  Widget get _editableInfoGender {
    return ProfileEditableInfo(
      icon: const Icon(Icons.wc_rounded),
      content: LocalKeys.pagesProfileInfosGenderNoGender.appExt.locale.toTr,
      onTap: () {},
    );
  }

  Widget get _editableInfoChangePassword {
    return ProfileEditableInfo(
      icon: const Icon(Icons.lock_rounded),
      content: LocalKeys.pagesProfileInfosChangePassword.appExt.locale.toTr,
      onTap: () {},
    );
  }

  Widget get _editableInfoLogOut {
    return ProfileEditableInfo(
      icon: const Icon(Icons.logout_rounded),
      content: LocalKeys.pagesProfileLogOut.appExt.locale.toTr,
      hasBorder: false,
      backgroundColor: context.extApp.theme.currentThemeColor.error.color,
      contentColor: context.extApp.theme.currentThemeColor.error.onColor,
      iconColor: context.extApp.theme.currentThemeColor.error.onColor,
      onTap: _onLogout,
    );
  }
}
