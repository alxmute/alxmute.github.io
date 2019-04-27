package ua.nmu.airportticketoffice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import ua.nmu.airportticketoffice.entity.*;
import ua.nmu.airportticketoffice.repository.AirpalneRepository;
import ua.nmu.airportticketoffice.repository.ClientRepository;
import ua.nmu.airportticketoffice.repository.PassportDataRepository;
import ua.nmu.airportticketoffice.repository.SeatRepository;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/clients")
public class ClientController {

    @Autowired
    private ClientRepository clientRepository;

    @Autowired
    private PassportDataRepository passportDataRepository;

    @GetMapping("/list")
    public String listClients(Model model) {
        List<Client> clients = clientRepository.findAllByOrderByLastNameAsc();

        model.addAttribute("clients", clients);

        return "/clients/list-clients";
    }

    @GetMapping("/client-info")
    public String clientInfo(@RequestParam int id, Model model) {
        Client client = clientRepository.findById(id).get();

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
        Client client = clientRepository.findById(id).get();

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
        passportData = passportDataRepository.save(passportData);
        Client client = new Client();
        if (clientId != null) {
            client.setId(clientId);
        }
        client.setLastName(lastName);
        client.setFirstName(firstName);
        client.setPatronymic(patronymic);
        client.setPassportData(passportData);

        List<Phone> clientPhones = new ArrayList<>(phones.length);

        for (int i = 0; i < phones.length; i++) {
            Phone phone = new Phone();
            if (ids != null && i < ids.length) {
                phone.setId(ids[i]);
            } else {
                phone.setId(0);
            }
            phone.setPhone(phones[i]);
            phone.setClient(client);
            clientPhones.add(phone);
        }
        client.setPhones(clientPhones);

        clientRepository.save(client);

        return "redirect:/clients/list";
    }

    @GetMapping("/delete")
    public String deleteEmployee(@RequestParam int id) {

        clientRepository.deleteById(id);

        return "redirect:/clients/list";
    }

}
