package ua.nmu.airportticketoffice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import ua.nmu.airportticketoffice.entity.Client;
import ua.nmu.airportticketoffice.entity.Schedule;
import ua.nmu.airportticketoffice.entity.Seat;
import ua.nmu.airportticketoffice.entity.Ticket;
import ua.nmu.airportticketoffice.service.ClientService;
import ua.nmu.airportticketoffice.service.ScheduleService;
import ua.nmu.airportticketoffice.service.TicketService;

import java.util.List;

@Controller
@RequestMapping("/tickets")
public class TicketController {

    @Autowired
    private ClientService clientService;

    @Autowired
    private ScheduleService scheduleService;

    @Autowired
    private TicketService ticketService;

    @GetMapping("/issuance")
    public String issueTicket(
            Model model,
            @RequestParam Integer id
    ) {

        List<Client> clients = clientService.findAllByOrderByLastNameAsc();
        Schedule schedule = scheduleService.findById(id);
        List<Seat> seats = schedule.getAirplane().getSeats();
        List<Seat> busySeats = schedule.getAirplane().getBusySeats(schedule.getId());

        model.addAttribute("clients", clients);
        model.addAttribute("schedule", schedule);
        model.addAttribute("seats", seats);
        model.addAttribute("busySeats", busySeats);

        return "/tickets/ticket-issuance";
    }

    @PostMapping("/save")
    public String saveTicket(
            @RequestParam int scheduleId,
            @RequestParam int clientId,
            @RequestParam int seatId,
            Model model
    ) {

        Ticket saveResult = ticketService.save(scheduleId, clientId, seatId);
        if (saveResult == null) {
            model.addAttribute("error", true);
            return issueTicket(model, scheduleId);
        }

        return "redirect:/tickets/list";
    }

    @GetMapping("/list")
    public String listTickets(Model model) {

        List<Ticket> tickets = ticketService.findAllByOrderBySaleDateDesc();

        model.addAttribute("tickets", tickets);

        return "/tickets/list-tickets";
    }

    @GetMapping("/clients-tickets")
    public String clientsTicketsList(Model model, @RequestParam int id) {

        Client client = clientService.findById(id);

        List<Ticket> tickets = client.getTickets();

        model.addAttribute("tickets", tickets);

        return "/tickets/list-tickets";
    }

    @GetMapping("/info")
    public String ticketInfo(@RequestParam int id, Model model) {

        Ticket ticket = ticketService.findById(id);

        model.addAttribute("ticket", ticket);

        return "/tickets/ticket-info";
    }

    @GetMapping("/delete")
    public String deleteTicket(@RequestParam int id) {

        ticketService.deleteById(id);

        return "redirect:/tickets/list";
    }
}
