///A class that defines a set of constants for the application's messages
class AppMessages {
  ///A class that defines a set of constants for the application's messages
  const AppMessages._();

  ///Application Name
  static const nameApp = 'GuardZone';

  ///Messages you welcome to be able to register with a new user account
  static const signupIntroMssg = 'Registrate para dar el primer paso en acceder'
      ' a la Justicia y a la información';

  /// A message asking users to enter their [name] as it is found that no information is available
  static const nameEmptyMssg = 'Por favor ingresa tu nombre completo';

  /// A message asking users to enter their [email] as it is found that no information is available
  static const emailEmptyMssg = 'Porfavor escribe tu email';

  ///A message asking users to enter their [password] as it is found that no information is available
  static const passEmptyMssg = 'Porfavor escribe tu contraseña';

  ///Message indicating that [passwords] do not match.
  static const passDismatchMssg = 'la contraseña no coinciden.';

  ///A message asking users to enter their [phone] as it is found that no information is available
  static const phoneEmptyMssg = 'Porfavor escribe tu celular';

  ///Message indicating a successful login.
  ///
  ///<signin>
  static const signinSuccessMssg = 'Inicio de sesión exitoso';

  ///Message indicating that the user has logged out.
  ///
  ///<logout>
  static const logoutMssg = 'Has cerrado sesión';

  /// Message indicating incorrect credentials, prompting the user to try again.
  ///
  /// <signin>
  static const incorrectCredentialsMssg =
      "La contraseña ingresada no es la correcta.";
  static const userNotFoundMssg = "El usuario no se encuentra registrado";
  static const emailAlreadyRegMssg =
      'El email ingresado ya se encuentra registrado, por favor ingresa otro email.';

  /// Message indicating successful account creation.
  /// <signup>
  static const signupSuccessMssg = 'Has creado tu cuenta con éxito';

  ///Message indicating unsuccessful account creation,
  /// prompting the user to try again.
  ///
  /// <signup>
  static const signupFailMssg =
      'No se ha podido crear tu cuenta, intentalo de nuevo.';

  ///Messages welcoming you to be able to log in
  ///
  ///<signin>
  static const signinIntroMssg = 'Completa la siguiente información'
      ' para acceder a tu perfil';

  ///
  static const noInternetMssg = 'No hay conexión a internet';
  static const errorMssg = 'Se produjo un error, intentalo de nuevo';

}