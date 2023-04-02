enum HttpError {
  badRequest,
  notFound,
  serverError,
  unauthorized,
  forbidden,
}

extension HttpErrorExtesion on HttpError {
  String get message {
    switch (this) {
      case HttpError.badRequest:
        return 'Erro! Parâmetros inválidos, tente novamente ...';
      case HttpError.notFound:
        return 'Erro! Não encontramos o que procura, tente novamente ...';
      case HttpError.unauthorized:
        return 'Erro! Usuário não autorizado.';
      case HttpError.forbidden:
        return 'Erro! Você não tem permissão possui permissão.';
      default:
        return 'Erro! Algo inesperado aconteceu, tente novamente mais tarde ...';
    }
  }
}
