package system.dao.employee;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import system.model.Employee;

import java.util.List;

@Repository
public class EmployeeDaoImpl implements EmployeeDao {

    private static final Logger logger = LoggerFactory.getLogger(EmployeeDaoImpl.class);

    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void addEmployee(Employee employee) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(employee);
        logger.info("Employee successfully saved. Employee: " + employee);
    }

    public void updateEmployee(Employee employee) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(employee);
        logger.info("Employee successfully update. Employee: " + employee);
    }

    public void removeEmployee(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Employee employee = (Employee) session.load(Employee.class, new Integer(id));

        if(employee != null){
            session.delete(employee);
            logger.info("Employee successfully removed. Employee: " + employee);
        }
    }

    public Employee getEmployeeByID(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Employee employee = (Employee) session.load(Employee.class, new Integer(id));
        logger.info("Employee successfully loader. Employee: " + employee);
        return employee;
    }

    @SuppressWarnings("unchecked")
    public List<Employee> listEmployee() {
        Session session = this.sessionFactory.getCurrentSession();
        List<Employee> list = session.createQuery("from Employee").list();

        for (Employee employee : list){
            logger.info("Employee list: " + employee);
        }
        return list;
    }
}
