package ua.nmu.airportticketoffice.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ua.nmu.airportticketoffice.entity.City;

import java.util.List;

public interface CityRepository extends JpaRepository<City, Integer> {
    List<City> findAllByOrderByNameAsc();
}
