import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../app/error/error.dart';
import '../../../../app/utils/utils.dart';
import '../../model/employee_model.dart';
import '../interface/interface.dart';

/// [EmployeeRepository] is a class that implements [IEmployee] interface, used to interact with the Employee API.
final class EmployeeRepository implements IEmployee {
  final Dio _dio;
  final StyledLog _log;

  EmployeeRepository({
    required Dio dio,
    required StyledLog log,
  })  : _dio = dio,
        _log = log;

  @override
  Future<Failure?> createEmployee(Employee employee) async {
    try {
      _log.i('Creating employee 🐥');

      final response = await _dio.post(
        '/employee',
        data: jsonEncode(employee.toJson()),
      );

      if (response.statusCode == 201) {
        _log.i('Employee created 🎉');
        return null;
      } else {
        _log.e('Failed to create employee ☹ \n ${response.data}');
        return const Failure(message: 'Failed to create employee');
      }
    } on DioException catch (err) {
      _log.e('Error creating employee ☹ \n $err');
      return Failure(
        message: err.message ?? "Something went wrong",
        code: err.response!.statusCode ?? 500,
      );
    } catch (err) {
      _log.e('Error creating employee ☹\n $err');
      return Failure(message: err.toString());
    }
  }

  @override
  Future<Failure?> deleteEmployeeById(String id) async {
    try {
      _log.i('Deleting employee 🗑');

      final response = await _dio.delete(
        '/employee/$id',
        data: jsonEncode({}),
      );

      if (response.statusCode == 200) {
        _log.i('Employee deleted 🎉');
        return null;
      } else {
        _log.e('Failed to delete employee ☹');
        return const Failure(message: 'Failed to delete employee');
      }
    } on DioException catch (err) {
      _log.e('Error deleting employee ☹ \n $err');
      return Failure(
        message: err.message ?? "Something went wrong",
        code: err.response!.statusCode ?? 500,
      );
    } catch (err) {
      _log.e('Error deleting employee ☹\n $err');
      return Failure(message: err.toString());
    }
  }

  @override
  Future<Either<Employee, Failure>> getEmployeeById(String id) async {
    try {
      _log.i('Getting employee 🐥');
      final response = await _dio.get(
        '/employee/$id',
      );

      if (response.statusCode == 200) {
        _log.i('Employee received 🎉');
        return Left(Employee.fromJson(response.data));
      } else {
        _log.e('Failed to get employee ☹');
        return const Right(Failure(message: 'Failed to get employee'));
      }
    } on DioException catch (err) {
      _log.e('Error getting employee ☹ \n $err');
      return Right(Failure(
        message: err.message ?? "Something went wrong",
        code: err.response!.statusCode ?? 500,
      ));
    } catch (err) {
      _log.e('Error getting employee ☹\n $err');
      return Right(Failure(message: err.toString()));
    }
  }

  @override
  Future<Either<List<Employee>, Failure>> getEmployees() async {
    try {
      _log.i('Getting employees 🐥');
      final response = await _dio.get(
        '/employee?limit=100&offset=0',
      );

      if (response.statusCode == 200) {
        _log.i('Employees received 🎉');
        return Left((response.data['data'] as List)
            .map((e) => Employee.fromJson(e))
            .toList());
      } else {
        _log.e('Failed to get employees ☹');
        return const Right(Failure(message: 'Failed to get employees'));
      }
    } on DioException catch (err) {
      _log.e('Error getting employees ☹ \n $err');
      return Right(Failure(
        message: err.message ?? "Something went wrong",
        code: err.response!.statusCode ?? 500,
      ));
    } catch (err) {
      _log.e('Error getting employees ☹\n $err');
      return Right(Failure(message: err.toString()));
    }
  }
}
