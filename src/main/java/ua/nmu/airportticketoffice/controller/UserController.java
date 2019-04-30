package ua.nmu.airportticketoffice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ua.nmu.airportticketoffice.entity.User;
import ua.nmu.airportticketoffice.repository.RoleRepository;
import ua.nmu.airportticketoffice.repository.UserRepository;

import java.util.List;

@Controller
@RequestMapping("/users")
public class UserController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RoleRepository roleRepository;

    @GetMapping("/list")
    public String listTickets(Model model) {

        List<User> users = userRepository.findAll();

        model.addAttribute("users", users);

        return "/users/list-users";
    }

    @GetMapping("/add")
    public String showFormForAdd(Model model) {
        User user = new User();

        model.addAttribute("theUser", user);
        model.addAttribute("roles", roleRepository.findAll());
        model.addAttribute("action", "Add");

        return "/users/user-form";
    }

    @GetMapping("/edit")
    public String showFormForEdit(@RequestParam int id, Model model) {
        User user = userRepository.findById(id).get();

        model.addAttribute("theUser", user);
        model.addAttribute("roles", roleRepository.findAll());
        model.addAttribute("action", "Update");


        return "/users/user-form";
    }

    @PostMapping("/save")
    public String saveUser(@ModelAttribute("user") User user) {

        user.setActive(true);
        userRepository.save(user);

        return "redirect:/users/list";
    }

    @GetMapping("/delete")
    public String deleteUser(@RequestParam int id) {

        userRepository.deleteById(id);

        return "redirect:/users/list";
    }
}
