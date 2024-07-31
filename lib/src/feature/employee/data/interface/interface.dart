import 'package:dartz/dartz.dart';

import '../../../../app/error/error.dart';
import '../../model/employee_model.dart';

abstract class IEmployee {
  Future<Either<List<Employee>, Failure>> getEmployees();

  Future<Failure?> createEmployee(Employee employee);

  Future<Failure?> deleteEmployeeById(String id);

  Future<Either<Employee, Failure>> getEmployeeById(String id);
}
