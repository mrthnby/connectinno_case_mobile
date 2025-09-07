import 'package:connectinno_case_mobile/core/shared/presentation/widgets/app_elevated_button.dart';
import 'package:connectinno_case_mobile/core/shared/presentation/widgets/app_scaffold.dart';
import 'package:connectinno_case_mobile/core/shared/presentation/widgets/app_snackbar.dart';
import 'package:connectinno_case_mobile/core/theme/app_dimens.dart';
import 'package:connectinno_case_mobile/core/theme/text_styles.dart';
import 'package:connectinno_case_mobile/features/auth/presentation/controllers/auth_bloc.dart';
import 'package:connectinno_case_mobile/features/auth/presentation/controllers/auth_event.dart';
import 'package:connectinno_case_mobile/features/auth/presentation/controllers/auth_state.dart';
import 'package:connectinno_case_mobile/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:connectinno_case_mobile/gen/assets.gen.dart';
import 'package:connectinno_case_mobile/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Forgot Password Page
class ForgotPasswordPage extends StatefulWidget {
  /// The [ForgotPasswordPage] constructor.
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  late final TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.maybeWhen(
          resetPasswordSent: () {
            AppSnackBar.show(
              context,
              LocaleKeys.ifThisEmailIsRegisteredYouWillReceiveAResetLink.tr(),
              type: SnackBarType.success,
            );
          },
          error: (message) {
            AppSnackBar.show(context, message, type: SnackBarType.error);
          },
          orElse: () {},
        );
      },
      child: AppScaffold(
        appBar: AppBar(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Text(
              LocaleKeys.forgotPasswordTitle.tr(),
              style: AppTextStyles.headline,
            ),
            AppDimens.h4,
            Text(
              LocaleKeys.enterYourEmailToResetYourPassword.tr(),
              style: AppTextStyles.subtitle,
            ),
            AppDimens.h32,
            AuthTextField(
              hintText: LocaleKeys.email.tr(),
              prefixIcon: Assets.icons.message,
              controller: _emailController,
            ),
            const Spacer(),
            AppDimens.h16,
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                return AppElevatedButton(
                  text: LocaleKeys.sendResetLink.tr(),
                  onPressed: () {
                    context.read<AuthBloc>().add(
                      AuthSendResetLinkEvent(email: _emailController.text),
                    );
                  },
                  isLoading: state is AuthLoadingState,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
