package ua.nmu.airportticketoffice.service;

import ua.nmu.airportticketoffice.entity.Client;
import ua.nmu.airportticketoffice.entity.PassportData;

import java.util.List;

public interface ClientService {
    Client save(Client client);

    Client save(
            PassportData passportData,
            Integer clientId,
            String lastName,
            String firstName,
            String patronymic,
            Integer[] phonesId,
            String[] phones
    );

    List<Client> saveAll(List<Client> clients);

    List<Client> findAll();

    List<Client> findAllByOrderByLastNameAsc();

    Client findById(int id);

    void delete(Client client);

    void deleteById(int id);
}
