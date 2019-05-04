package ua.nmu.airportticketoffice.service;

import ua.nmu.airportticketoffice.entity.PassportData;

import java.util.List;

public interface PassportDataService {
    PassportData save(PassportData passportData);

    List<PassportData> saveAll(List<PassportData> passportsData);

    List<PassportData> findAll();

    PassportData findById(int id);

    void delete(PassportData passportData);

    void deleteById(int id);
}
