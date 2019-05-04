package ua.nmu.airportticketoffice.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ua.nmu.airportticketoffice.entity.PassportData;
import ua.nmu.airportticketoffice.repository.PassportDataRepository;
import ua.nmu.airportticketoffice.service.PassportDataService;

import java.util.List;

@Service
public class PassportDataServiceImpl implements PassportDataService {

    @Autowired
    private PassportDataRepository passportDataRepository;

    @Override
    public PassportData save(PassportData passportData) {
        return passportDataRepository.save(passportData);
    }

    @Override
    public List<PassportData> saveAll(List<PassportData> passportsData) {
        return passportDataRepository.saveAll(passportsData);
    }

    @Override
    public List<PassportData> findAll() {
        return passportDataRepository.findAll();
    }

    @Override
    public PassportData findById(int id) {
        return passportDataRepository.findById(id).get();
    }

    @Override
    public void delete(PassportData passportData) {
        passportDataRepository.delete(passportData);
    }

    @Override
    public void deleteById(int id) {
        passportDataRepository.deleteById(id);
    }
}
