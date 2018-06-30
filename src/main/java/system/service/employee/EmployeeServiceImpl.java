package system.service.employee;

import org.springframework.stereotype.Service;
import system.dao.employee.EmployeeDao;
import system.model.Employee;

import javax.transaction.Transactional;
import java.util.List;

@Service
public class EmployeeServiceImpl implements EmployeeService {

    private EmployeeDao employeeDao;

    public void setEmployeeDao(EmployeeDao employeeDao) {
        this.employeeDao = employeeDao;
    }

    @Transactional
    public void addEmployee(Employee employee) {
        this.employeeDao.addEmployee(employee);
    }

    @Transactional
    public void updateEmployee(Employee employee) {
        this.employeeDao.updateEmployee(employee);
    }

    @Transactional
    public void removeEmployee(int id) {
        this.employeeDao.removeEmployee(id);
    }

    @Transactional
    public Employee getEmployeeByID(int id) {
        return this.employeeDao.getEmployeeByID(id);
    }

    public List<Employee> listEmployee() {
        return this.employeeDao.listEmployee();
    }
}
