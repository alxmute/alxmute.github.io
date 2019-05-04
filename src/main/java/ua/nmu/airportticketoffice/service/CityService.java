package ua.nmu.airportticketoffice.service;

import ua.nmu.airportticketoffice.entity.City;

import java.util.List;

public interface CityService {
    City save(City city);

    List<City> saveAll(List<City> cities);

    List<City> findAll();

    List<City> findAllByOrderByNameAsc();

    City findById(int id);

    void delete(City city);

    void deleteById(int id);
}
