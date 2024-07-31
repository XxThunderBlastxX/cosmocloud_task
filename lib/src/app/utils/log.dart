import 'package:logger/logger.dart';

class StyledLog {
  final Logger _logger;

  StyledLog({required Logger logger}) : _logger = logger;

  void d(dynamic message) {
    _logger.d(message);
  }

  void e(dynamic message) {
    _logger.e(message);
  }

  void i(dynamic message) {
    _logger.i(message);
  }

  void v(dynamic message) {
    _logger.t(message);
  }

  void w(dynamic message) {
    _logger.w(message);
  }

  void f(dynamic message) {
    _logger.f(message);
  }
}
