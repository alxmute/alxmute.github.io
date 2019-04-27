package ua.nmu.airportticketoffice.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ua.nmu.airportticketoffice.entity.Country;

public interface CountryRepository extends JpaRepository<Country, Integer> {
}
