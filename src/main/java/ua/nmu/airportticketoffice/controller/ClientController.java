package ua.nmu.airportticketoffice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import ua.nmu.airportticketoffice.entity.Client;
import ua.nmu.airportticketoffice.entity.PassportData;
import ua.nmu.airportticketoffice.service.ClientService;

import java.util.List;

@Controller
@RequestMapping({"/clients", "/"})

public class ClientController {

    @Autowired
    private ClientService clientService;

    @RequestMapping("/")
    public String start(Model model) {
        return "redirect:/clients/list";
    }

    @GetMapping("/list")
    public String listClients(Model model) {

        List<Client> clients = clientService.findAllByOrderByLastNameAsc();

        model.addAttribute("clients", clients);

        return "/clients/list-clients";
    }

    @GetMapping("/client-info")
    public String clientInfo(@RequestParam int id, Model model) {

        Client client = clientService.findById(id);

        model.addAttribute("client", client);

        return "/clients/client-info";
    }

    @GetMapping("/add")
    public String showFormForAdd(Model model) {

        PassportData passportData = new PassportData();

        model.addAttribute("passportData", passportData);
        model.addAttribute("action", "Add");

        return "/clients/client-form";
    }

    @GetMapping("/edit")
    public String showFormForEdit(@RequestParam int id, Model model) {

        Client client = clientService.findById(id);

        model.addAttribute("passportData", client.getPassportData());
        model.addAttribute("action", "Update");

        return "/clients/client-form";
    }

    @GetMapping("/save")
    public String saveClient(
            @ModelAttribute("passportData") PassportData passportData,
            @RequestParam(name = "clientId", required = false) Integer clientId,
            @RequestParam String lastName,
            @RequestParam String firstName,
            @RequestParam String patronymic,
            @RequestParam(name = "phone") String[] phones,
            @RequestParam(name = "phoneId", required = false) Integer[] ids
    ) {

        clientService.save(passportData, clientId, lastName, firstName, patronymic, ids, phones);

        return "redirect:/clients/list";
    }

    @GetMapping("/delete")
    public String deleteEmployee(@RequestParam int id) {

        clientService.deleteById(id);

        return "redirect:/clients/list";
    }

}
