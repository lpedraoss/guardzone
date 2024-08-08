import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guardzone/core/domain/status/status.dart';
import 'package:guardzone/core/presentation/theme/theme.dart';
import 'package:guardzone/core/routes/routes.dart';
import 'package:guardzone/core/utils/messages/messages.dart';


void showMssg({
  required Status status,
  required BuildContext context,
  String? onNavigate,
}) {
  late String message;
  late Icon icon;
  Color color = context.culturedOP10;
  switch (status) {
    case Status.initial:
      icon = const Icon(Icons.home);
      message = 'Bienvenido a ${AppMessages.nameApp}, inicia sesión por favor';
    case Status.inProcess:
      icon = const Icon(Icons.watch_later_outlined);
      message = 'Aguarde un momento por favor';
    case Status.login:
      context.push(onNavigate ?? IndexRoutes.home);
      icon = const Icon(Icons.check);
      message = AppMessages.signinSuccessMssg;

      break;
    case Status.logout:
      icon = const Icon(Icons.logout);
      message = AppMessages.logoutMssg;
      context.go(
        IndexRoutes.home,
      );
      break;
    case Status.incorrectCredential:
      icon = const Icon(Icons.no_accounts_outlined);
      message = AppMessages.incorrectCredentialsMssg;
      break;
    case Status.noInternet:
      icon = const Icon(Icons.no_accounts_outlined);
      message = AppMessages.noInternetMssg;
      break;
    case Status.fail:
      icon = const Icon(Icons.no_accounts_outlined);
      message = AppMessages.errorMssg;
      break;
    case Status.registered:
      icon = const Icon(Icons.switch_account);
      message = AppMessages.signupSuccessMssg;
      break;
    case Status.noRegistered:
      icon = const Icon(Icons.sms_failed);
      message = AppMessages.emailAlreadyRegMssg;
      break;
    case Status.userNotFound:
      icon = const Icon(Icons.no_accounts);
      message = AppMessages.userNotFoundMssg;
      break;
    default:
      break;
  }

  // Elimina el Snackbar actual antes de mostrar uno nuevo
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
  //muestra el mensaje correspondiente
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: color,
      content: Row(
        children: [
          icon,
          const SizedBox(
            width: 5,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .75,
            child: Wrap(
              children: [
                Text(
                  message,
                  style: context.labelMedium.copyWith(
                      color: Theme.of(context).textTheme.bodyMedium!.color),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
