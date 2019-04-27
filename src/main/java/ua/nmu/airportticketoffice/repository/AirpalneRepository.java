package ua.nmu.airportticketoffice.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ua.nmu.airportticketoffice.entity.Airplane;

public interface AirpalneRepository extends JpaRepository<Airplane, Integer> {
}
