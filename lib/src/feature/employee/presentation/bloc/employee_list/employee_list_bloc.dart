import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app/error/error.dart';
import '../../../data/repository/repository.dart';
import '../../../model/employee_model.dart';

part 'employee_list_event.dart';
part 'employee_list_state.dart';

class EmployeeListBloc extends Bloc<EmployeeEvent, EmployeeState> {
  final EmployeeRepository _employeeRepository;

  EmployeeListBloc(EmployeeRepository employeeRepository)
      : _employeeRepository = employeeRepository,
        super(const EmployeeState()) {
    on<GetAllEmployeeEvent>((event, emit) async {
      emit(const EmployeeListLoadingState());

      final employees = await _employeeRepository.getAllEmployees();

      employees.fold(
        (employees) => emit(EmployeeList(employees)),
        (failure) => emit(EmployeeListErrorState(failure)),
      );
    });

    on<DeleteEmployeeEvent>((event, emit) async {
      emit(const EmployeeListLoadingState());

      final failure = await _employeeRepository.deleteEmployeeById(event.id);

      if (failure == null) {
        add(const GetAllEmployeeEvent());
      } else {
        emit(EmployeeListErrorState(failure));
      }
    });

    on<CreateEmployeeEvent>((event, emit) async {
      emit(const EmployeeListLoadingState());

      final failure = await _employeeRepository.createEmployee(event.employee);

      if (failure == null) {
        add(const GetAllEmployeeEvent());
      } else {
        emit(EmployeeListErrorState(failure));
      }
    });
  }
}
