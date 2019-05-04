package ua.nmu.airportticketoffice.service;

import ua.nmu.airportticketoffice.entity.Ticket;

import java.util.List;

public interface TicketService {
    Ticket save(Ticket ticket);

    Ticket save(int scheduleId, int clientId, int seatId);

    List<Ticket> saveAll(List<Ticket> tickets);

    List<Ticket> findAll();

    List<Ticket> findAllByOrderBySaleDateDesc();

    Ticket findById(int id);

    void delete(Ticket ticket);

    void deleteById(int id);
}
