package ua.nmu.airportticketoffice.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ua.nmu.airportticketoffice.entity.Seat;

public interface SeatRepository extends JpaRepository<Seat, Integer> {
}
