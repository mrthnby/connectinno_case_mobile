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

/// Login Page
class LoginPage extends StatefulWidget {
  /// The [LoginPage] constructor.
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
              LocaleKeys.welcomeBack.tr(),
              style: AppTextStyles.headline,
            ),
            AppDimens.h4,
            Text(
              LocaleKeys.loginToYourAccount.tr(),
              style: AppTextStyles.subtitle,
            ),
            AppDimens.h32,
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
              textInputAction: TextInputAction.done,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () => ForgotPasswordPageRoute().push<void>(context),
                child: Text(
                  LocaleKeys.forgotPassword.tr(),
                  style: AppTextStyles.smallLink,
                ),
              ),
            ),
            const Spacer(),
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                return AppElevatedButton(
                  text: LocaleKeys.login.tr(),
                  onPressed: () {
                    context.read<AuthBloc>().add(
                      AuthLoginEvent(
                        email: _emailController.text,
                        password: _passwordController.text,
                      ),
                    );
                  },
                  isLoading: state is AuthLoadingState,
                );
              },
            ),
            AppDimens.h16,
            AuthRedirectButton(
              text: LocaleKeys.dontHaveAnAccount.tr(),
              redirectText: LocaleKeys.signUp.tr(),
              onPressed: () => RegisterPageRoute().pushReplacement(context),
            ),
          ],
        ),
      ),
    );
  }
}
