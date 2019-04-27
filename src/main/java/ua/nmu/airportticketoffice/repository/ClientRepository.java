package ua.nmu.airportticketoffice.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ua.nmu.airportticketoffice.entity.Client;

import java.util.List;

public interface ClientRepository extends JpaRepository<Client, Integer> {
    List<Client> findAllByOrderByLastNameAsc();
}
