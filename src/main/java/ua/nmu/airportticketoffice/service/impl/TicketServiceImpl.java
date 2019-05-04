package ua.nmu.airportticketoffice.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ua.nmu.airportticketoffice.entity.Client;
import ua.nmu.airportticketoffice.entity.Schedule;
import ua.nmu.airportticketoffice.entity.Seat;
import ua.nmu.airportticketoffice.entity.Ticket;
import ua.nmu.airportticketoffice.repository.TicketRepository;
import ua.nmu.airportticketoffice.service.ClientService;
import ua.nmu.airportticketoffice.service.ScheduleService;
import ua.nmu.airportticketoffice.service.SeatService;
import ua.nmu.airportticketoffice.service.TicketService;

import java.time.Clock;
import java.time.LocalDateTime;
import java.util.List;

@Service
public class TicketServiceImpl implements TicketService {

    @Autowired
    private TicketRepository ticketRepository;

    @Autowired
    private ClientService clientService;

    @Autowired
    private SeatService seatService;

    @Autowired
    private ScheduleService scheduleService;

    @Override
    public Ticket save(Ticket ticket) {
        return ticketRepository.save(ticket);
    }

    @Override
    public Ticket save(int scheduleId, int clientId, int seatId) {

        Schedule schedule = scheduleService.findById(scheduleId);
        Client client = clientService.findById(clientId);
        Seat seat = seatService.findById(seatId);

        Ticket ticket = new Ticket();

        ticket.setSchedule(schedule);
        ticket.setClient(client);
        ticket.setSeat(seat);
        ticket.setSaleDate(LocalDateTime.now(Clock.systemUTC()));

        return ticketRepository.save(ticket);
    }

    @Override
    public List<Ticket> saveAll(List<Ticket> tickets) {
        return ticketRepository.saveAll(tickets);
    }

    @Override
    public List<Ticket> findAll() {
        return ticketRepository.findAll();
    }

    @Override
    public List<Ticket> findAllByOrderBySaleDateDesc() {
        return ticketRepository.findAllByOrderBySaleDateDesc();
    }

    @Override
    public Ticket findById(int id) {
        return ticketRepository.findById(id).get();
    }

    @Override
    public void delete(Ticket ticket) {
        ticketRepository.delete(ticket);
    }

    @Override
    public void deleteById(int id) {
        ticketRepository.deleteById(id);
    }
}
