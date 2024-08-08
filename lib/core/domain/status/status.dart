/// Enum representing different states or statuses of a process.
///
/// - [notSubmitted]: The process or task has not been submitted.
/// - [fail]: The process or task has failed.
/// - [success]: The process or task has been successfully completed.
/// - [inProcess]: The process or task is currently in progress.
enum Status {
  ///
  initial,
  /// The process or task has not been submitted.
  notSubmitted,

  /// The process or task has been submitted.
  submitted,

  /// The process or task has failed.
  fail,

  /// The process or task has been successfully completed.
  success,

  /// The process or task is currently in progress.
  inProcess,

  ///cierre de sesión
  logout,
  login,
  ///no conection
  noInternet,

  ///is loading
  loading,
  ///
  incorrectCredential,
  ///
  registered,
  ///
  noRegistered,
  ///
  userNotFound
}

extension ExtraStatus on Status {
  bool get isLoading {
    return this == Status.loading;
  }
}
