part of 'employee_bloc.dart';

final class EmployeeState extends Equatable {
  const EmployeeState();

  @override
  List<Object?> get props => [];
}

final class EmployeeList extends EmployeeState {
  final List<Employee> employees;

  const EmployeeList(this.employees);

  @override
  List<Object> get props => [employees];
}

final class LoadingState extends EmployeeState {
  const LoadingState();

  @override
  List<Object> get props => [];
}

final class ErrorState extends EmployeeState {
  final Failure failure;

  const ErrorState(this.failure);

  @override
  List<Object> get props => [failure];
}
