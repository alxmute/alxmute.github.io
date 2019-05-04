package ua.nmu.airportticketoffice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ua.nmu.airportticketoffice.entity.Role;
import ua.nmu.airportticketoffice.entity.User;
import ua.nmu.airportticketoffice.service.RoleService;
import ua.nmu.airportticketoffice.service.UserService;

import java.util.List;

@Controller
@RequestMapping("/users")
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private RoleService roleService;

    @GetMapping("/list")
    public String listTickets(Model model) {

        List<User> users = userService.findAll();

        model.addAttribute("users", users);

        return "/users/list-users";
    }

    @GetMapping("/add")
    public String showFormForAdd(Model model) {

        User user = new User();
        List<Role> roles = roleService.findAll();

        model.addAttribute("theUser", user);
        model.addAttribute("roles", roles);
        model.addAttribute("action", "Add");

        return "/users/user-form";
    }

    @GetMapping("/edit")
    public String showFormForEdit(@RequestParam int id, Model model) {

        User user = userService.findById(id);
        List<Role> roles = roleService.findAll();

        model.addAttribute("theUser", user);
        model.addAttribute("roles", roles);
        model.addAttribute("action", "Update");

        return "/users/user-form";
    }

    @PostMapping("/save")
    public String saveUser(@ModelAttribute("user") User user) {

        userService.save(user);

        return "redirect:/users/list";
    }

    @GetMapping("/delete")
    public String deleteUser(@RequestParam int id) {

        userService.deleteById(id);

        return "redirect:/users/list";
    }
}
