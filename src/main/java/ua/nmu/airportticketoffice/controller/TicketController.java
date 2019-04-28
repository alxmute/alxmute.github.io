package ua.nmu.airportticketoffice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import ua.nmu.airportticketoffice.entity.Client;
import ua.nmu.airportticketoffice.entity.Schedule;
import ua.nmu.airportticketoffice.entity.Seat;
import ua.nmu.airportticketoffice.entity.Ticket;
import ua.nmu.airportticketoffice.repository.ClientRepository;
import ua.nmu.airportticketoffice.repository.ScheduleRepository;
import ua.nmu.airportticketoffice.repository.SeatRepository;
import ua.nmu.airportticketoffice.repository.TicketRepository;

import java.time.Clock;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

@Controller
@RequestMapping("/tickets")
public class TicketController {

    @Autowired
    private ClientRepository clientRepository;

    @Autowired
    private SeatRepository seatRepository;

    @Autowired
    private ScheduleRepository scheduleRepository;

    @Autowired
    private TicketRepository ticketRepository;

    @GetMapping("/issuance")
    public String ticketIssuance(
            Model model,
            @RequestParam Integer id
    ) {

        List<Client> clients = clientRepository.findAllByOrderByLastNameAsc();
        Schedule schedule = scheduleRepository.findById(id).get();
        List<Seat> seats = schedule.getAirplane().getSeats();
        seats.sort(Comparator.comparing(Seat::getSeatNumber));

        List<Seat> busySeats = new ArrayList<>();
        for (Ticket t : schedule.getTickets()){
            busySeats.add(t.getSeat());
        }

        model.addAttribute("clients", clients);
        model.addAttribute("schedule", schedule);
        model.addAttribute("seats", seats);
        model.addAttribute("busySeats", busySeats);

        return "/tickets/ticket-issuance";
    }

    @GetMapping("/save")
    public String save(
            @RequestParam int scheduleId,
            @RequestParam int clientId,
            @RequestParam int seatId
    ) {
        Schedule schedule = scheduleRepository.findById(scheduleId).get();
        Client client = clientRepository.findById(clientId).get();
        Seat seat = seatRepository.findById(seatId).get();

        Ticket ticket = new Ticket();

        ticket.setSchedule(schedule);
        ticket.setClient(client);
        ticket.setSeat(seat);
        ticket.setSaleDate(LocalDateTime.now(Clock.systemUTC()));

        ticketRepository.save(ticket);

        return "redirect:/flights/schedule";
    }

//    @GetMapping("/add")
//    public String showFormForAdd(Model model) {
//        PassportData passportData = new PassportData();
//
//        model.addAttribute("passportData", passportData);
//        model.addAttribute("action", "Add");
//
//        return "/clients/client-form";
//    }
//
//    @GetMapping("/edit")
//    public String showFormForEdit(@RequestParam int id, Model model) {
//        Client client = clientRepository.findById(id).get();
//
//        model.addAttribute("passportData", client.getPassportData());
//        model.addAttribute("action", "Update");
//
//        return "/clients/client-form";
//    }
//
//    @GetMapping("/save")
//    public String saveClient(
//            @ModelAttribute("passportData") PassportData passportData,
//            @RequestParam(name = "clientId", required = false) Integer clientId,
//            @RequestParam String lastName,
//            @RequestParam String firstName,
//            @RequestParam String patronymic,
//            @RequestParam(name = "phone") String[] phones,
//            @RequestParam(name = "phoneId", required = false) Integer[] ids
//    ) {
//        passportData = passportDataRepository.save(passportData);
//        Client client = new Client();
//        if (clientId != null) {
//            client.setId(clientId);
//        }
//        client.setLastName(lastName);
//        client.setFirstName(firstName);
//        client.setPatronymic(patronymic);
//        client.setPassportData(passportData);
//
//        List<Phone> clientPhones = new ArrayList<>(phones.length);
//
//        for (int i = 0; i < phones.length; i++) {
//            Phone phone = new Phone();
//            if (ids != null && i < ids.length) {
//                phone.setId(ids[i]);
//            } else {
//                phone.setId(0);
//            }
//            phone.setPhone(phones[i]);
//            phone.setClient(client);
//            clientPhones.add(phone);
//        }
//        client.setPhones(clientPhones);
//
//        clientRepository.save(client);
//
//        return "redirect:/clients/list";
//    }
//
//    @GetMapping("/delete")
//    public String deleteEmployee(@RequestParam int id) {
//
//        clientRepository.deleteById(id);
//
//        return "redirect:/clients/list";
//    }

}
