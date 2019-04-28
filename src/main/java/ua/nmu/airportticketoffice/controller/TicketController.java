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
    public String issueTicket(
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
    public String saveTicket(
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

        return "redirect:/tickets/list";
    }

    @GetMapping("/list")
    public String listTickets(Model model) {

        List<Ticket> tickets = ticketRepository.findAllByOrderBySaleDateDesc();

        model.addAttribute("tickets", tickets);

        return "/tickets/list-tickets";
    }

    @GetMapping("/clients-tickets")
    public String clientsTicketsList(Model model, @RequestParam int id) {

        Client client = clientRepository.findById(id).get();

        List<Ticket> tickets = client.getTickets();

        model.addAttribute("tickets", tickets);

        return "/tickets/list-tickets";
    }

    @GetMapping("/info")
    public String ticketInfo(@RequestParam int id, Model model) {

        Ticket ticket = ticketRepository.findById(id).get();

        model.addAttribute("ticket", ticket);

        return "/tickets/ticket-info";
    }

    @GetMapping("/delete")
    public String deleteTicket(@RequestParam int id) {

        ticketRepository.deleteById(id);

        return "redirect:/tickets/list";
    }
}
