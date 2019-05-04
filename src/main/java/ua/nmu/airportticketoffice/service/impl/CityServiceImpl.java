package ua.nmu.airportticketoffice.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ua.nmu.airportticketoffice.entity.City;
import ua.nmu.airportticketoffice.repository.CityRepository;
import ua.nmu.airportticketoffice.service.CityService;

import java.util.List;

@Service
public class CityServiceImpl implements CityService {

    @Autowired
    private CityRepository cityRepository;

    @Override
    public City save(City city) {
        return cityRepository.save(city);
    }

    @Override
    public List<City> saveAll(List<City> cities) {
        return cityRepository.saveAll(cities);
    }

    @Override
    public List<City> findAll() {
        return cityRepository.findAll();
    }

    @Override
    public List<City> findAllByOrderByNameAsc() {
        return cityRepository.findAllByOrderByNameAsc();
    }

    @Override
    public City findById(int id) {
        return cityRepository.findById(id).get();
    }

    @Override
    public void delete(City city) {
        cityRepository.delete(city);
    }

    @Override
    public void deleteById(int id) {
        cityRepository.deleteById(id);
    }
}
