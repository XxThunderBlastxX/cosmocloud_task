part of 'employee_list_bloc.dart';

sealed class EmployeeEvent extends Equatable {
  const EmployeeEvent();
}

final class CreateEmployeeEvent extends EmployeeEvent {
  final Employee employee;

  const CreateEmployeeEvent(this.employee);

  @override
  List<Object> get props => [employee];
}

final class GetAllEmployeeEvent extends EmployeeEvent {
  const GetAllEmployeeEvent();

  @override
  List<Object> get props => [];
}

final class GetEmployeeEvent extends EmployeeEvent {
  final String id;

  const GetEmployeeEvent(this.id);

  @override
  List<Object> get props => [id];
}

final class DeleteEmployeeEvent extends EmployeeEvent {
  final String id;

  const DeleteEmployeeEvent(this.id);

  @override
  List<Object> get props => [id];
}
