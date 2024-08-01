part of 'employee_list_bloc.dart';

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

final class EmployeeListLoadingState extends EmployeeState {
  const EmployeeListLoadingState();

  @override
  List<Object> get props => [];
}

final class EmployeeListErrorState extends EmployeeState {
  final Failure failure;

  const EmployeeListErrorState(this.failure);

  @override
  List<Object> get props => [failure];
}
