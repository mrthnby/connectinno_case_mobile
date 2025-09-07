import 'package:connectinno_case_mobile/core/router/routes.dart';
import 'package:connectinno_case_mobile/core/shared/presentation/widgets/app_elevated_button.dart';
import 'package:connectinno_case_mobile/core/shared/presentation/widgets/app_scaffold.dart';
import 'package:connectinno_case_mobile/core/shared/presentation/widgets/app_snackbar.dart';
import 'package:connectinno_case_mobile/core/theme/app_dimens.dart';
import 'package:connectinno_case_mobile/core/theme/text_styles.dart';
import 'package:connectinno_case_mobile/features/auth/presentation/controllers/auth_bloc.dart';
import 'package:connectinno_case_mobile/features/auth/presentation/controllers/auth_event.dart';
import 'package:connectinno_case_mobile/features/auth/presentation/controllers/auth_state.dart';
import 'package:connectinno_case_mobile/features/auth/presentation/widgets/auth_redirect_button.dart';
import 'package:connectinno_case_mobile/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:connectinno_case_mobile/gen/assets.gen.dart';
import 'package:connectinno_case_mobile/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Register Page
class RegisterPage extends StatefulWidget {
  /// The [RegisterPage] constructor.
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.maybeWhen(
          successfullyLoggedIn: () {
            HomePageRoute().pushReplacement(context);
          },
          error: (message) {
            AppSnackBar.show(context, message, type: SnackBarType.error);
          },
          orElse: () {},
        );
      },
      child: AppScaffold(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(
              flex: 2,
            ),
            Text(
              LocaleKeys.createAccount.tr(),
              style: AppTextStyles.headline,
            ),
            AppDimens.h4,
            Text(
              LocaleKeys.signUpToGetStarted.tr(),
              style: AppTextStyles.subtitle,
            ),
            AppDimens.h32,
            AuthTextField(
              hintText: LocaleKeys.name.tr(),
              prefixIcon: Assets.icons.addUser,
              controller: _nameController,
            ),
            AppDimens.h16,
            AuthTextField(
              hintText: LocaleKeys.email.tr(),
              prefixIcon: Assets.icons.message,
              controller: _emailController,
            ),
            AppDimens.h16,
            AuthTextField(
              hintText: LocaleKeys.password.tr(),
              prefixIcon: Assets.icons.unlock,
              controller: _passwordController,
              obscureText: true,
              onFieldSubmitted: (value) {
                FocusScope.of(context).nextFocus();
              },
            ),
            AppDimens.h16,
            AuthTextField(
              hintText: LocaleKeys.confirmPassword.tr(),
              prefixIcon: Assets.icons.unlock,
              controller: _confirmPasswordController,
              obscureText: true,
              textInputAction: TextInputAction.done,
            ),
            const Spacer(),
            AppDimens.h16,
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                return AppElevatedButton(
                  text: LocaleKeys.signUp.tr(),
                  onPressed: () {
                    context.read<AuthBloc>().add(
                      AuthRegisterEvent(
                        email: _emailController.text,
                        password: _passwordController.text,
                        name: _nameController.text,
                        confirmPassword: _confirmPasswordController.text,
                      ),
                    );
                  },
                  isLoading: state is AuthLoadingState,
                );
              },
            ),
            AppDimens.h16,
            AuthRedirectButton(
              text: LocaleKeys.alreadyHaveAnAccount.tr(),
              redirectText: LocaleKeys.login.tr(),
              onPressed: () => LoginPageRoute().pushReplacement(context),
            ),
          ],
        ),
      ),
    );
  }
}
