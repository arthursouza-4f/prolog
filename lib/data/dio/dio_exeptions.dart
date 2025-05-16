import 'package:dio/dio.dart';

class DioExceptions implements Exception {
  late String errorMessage;

  DioExceptions.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        errorMessage = 'Tempo de conexão esgotado';
        break;
      case DioExceptionType.sendTimeout:
        errorMessage = 'Tempo de envio excedido';
        break;
      case DioExceptionType.receiveTimeout:
        errorMessage = 'Tempo de resposta excedido';
        break;
      case DioExceptionType.badCertificate:
        errorMessage = 'Certificado inválido';
        break;
      case DioExceptionType.badResponse:
        errorMessage = _handleError(dioException.response?.statusCode);
        break;
      case DioExceptionType.cancel:
        errorMessage = 'Requisição cancelada';
        break;
      case DioExceptionType.connectionError:
        errorMessage = 'Erro de conexão';
        break;
      case DioExceptionType.unknown:
        errorMessage = 'Erro desconhecido';
        break;
    }
  }

  String _handleError(int? statusCode) {
    switch (statusCode) {
      case 400:
        return 'Requisição inválida';
      case 401:
        return 'Não autorizado';
      case 403:
        return 'Parece que você não tem permissão para acessar esta rota';
      case 404:
        return 'Rota inexistente';
      case 500:
        return 'Erro interno do servidor';
      default:
        return 'Erro desconhecido';
    }
  }

  @override
  String toString() => errorMessage;
}
