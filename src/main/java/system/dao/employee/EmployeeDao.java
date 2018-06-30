package system.dao.employee;

import system.model.Employee;

import java.util.List;

public interface EmployeeDao {
    void addEmployee(Employee employee);
    void updateEmployee(Employee employee);
    void removeEmployee(int id);
    Employee getEmployeeByID(int id);
    List<Employee> listEmployee();
}
