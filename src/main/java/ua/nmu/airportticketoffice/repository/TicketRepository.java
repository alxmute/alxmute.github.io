package ua.nmu.airportticketoffice.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ua.nmu.airportticketoffice.entity.Ticket;

public interface TicketRepository extends JpaRepository<Ticket, Integer> {
}
