package system.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import system.model.Employee;
import system.service.employee.EmployeeService;

@Controller
public class EmployeeController {
    private EmployeeService employeeService;

    @Autowired(required = true)
    @Qualifier(value = "employeeService")
    public void setEmployeeService(EmployeeService employeeService) {
        this.employeeService = employeeService;
    }

    @RequestMapping(value = "employees", method = RequestMethod.GET)
    public String listEmployee(Model model){
        model.addAttribute("employee", new Employee());
        model.addAttribute("listEmployees", this.employeeService.listEmployee());
        return "employees";
    }

    @RequestMapping(value = "/employees/add", method = RequestMethod.POST)
    public String addEmployee(@ModelAttribute("employee")Employee employee){
        if (employee.getId() == 0){
            this.employeeService.addEmployee(employee);
        }else {
            this.employeeService.updateEmployee(employee);
        }
        return "redirect:/employees";
    }

    @RequestMapping(value = "/remove/{id}")
    private String removeEmployee(@PathVariable("id")int id){
        this.employeeService.removeEmployee(id);
        return "redirect:/employees";
    }

    @RequestMapping("edit/{id}")
    public String editEmployee(@ModelAttribute("id") int id, Model model){
        model.addAttribute("employee", this.employeeService.getEmployeeByID(id));
        model.addAttribute("listEmployees", this.employeeService.listEmployee());
        return "employees";
    }

    @RequestMapping("employeeDate/{id}")
    public String employeeDate(@PathVariable("id") int id, Model model){
        model.addAttribute("employee", this.employeeService.getEmployeeByID(id));
        return "employee";
    }
}
