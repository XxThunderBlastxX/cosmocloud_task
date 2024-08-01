import 'package:dartz/dartz.dart';

import '../../../../app/error/error.dart';
import '../../model/employee_model.dart';

/// [IEmployee] is an abstract class that defines the methods to interact with the Employee API.
abstract class IEmployee {
  Future<Either<List<Employee>, Failure>> getEmployees();

  Future<Failure?> createEmployee(Employee employee);

  Future<Failure?> deleteEmployeeById(String id);

  Future<Either<Employee, Failure>> getEmployeeById(String id);
}
