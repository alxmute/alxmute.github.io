package ua.nmu.airportticketoffice.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ua.nmu.airportticketoffice.entity.Phone;

public interface PhoneRepository extends JpaRepository<Phone,Integer> {
}
