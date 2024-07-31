import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/error/error.dart';
import '../../data/repository/repository.dart';
import '../../model/employee_model.dart';

part 'employee_event.dart';
part 'employee_state.dart';

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
  final EmployeeRepository _employeeRepository;

  EmployeeBloc({
    required EmployeeRepository employeeRepository,
  })  : _employeeRepository = employeeRepository,
        super(const EmployeeState()) {
    on<GetAllEmployeeEvent>((event, emit) async {
      emit(const LoadingState());

      final employees = await _employeeRepository.getEmployees();

      employees.fold(
        (employees) => emit(EmployeeList(employees)),
        (failure) => emit(ErrorState(failure)),
      );
    });

    on<GetEmployeeEvent>((event, emit) async {
      emit(const LoadingState());

      final employee = await _employeeRepository.getEmployeeById(event.id);

      employee.fold(
        (employee) => emit(EmployeeList([employee])),
        (failure) => emit(ErrorState(failure)),
      );
    });

    on<DeleteEmployeeEvent>((event, emit) async {
      emit(const LoadingState());

      final failure = await _employeeRepository.deleteEmployeeById(event.id);

      if (failure == null) {
        add(const GetAllEmployeeEvent());
      } else {
        emit(ErrorState(failure));
      }
    });

    on<CreateEmployeeEvent>((event, emit) async {
      emit(const LoadingState());

      final failure = await _employeeRepository.createEmployee(event.employee);

      if (failure == null) {
        add(const GetAllEmployeeEvent());
      } else {
        emit(ErrorState(failure));
      }
    });
  }
}
