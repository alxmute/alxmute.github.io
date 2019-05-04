package ua.nmu.airportticketoffice.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ua.nmu.airportticketoffice.entity.Client;
import ua.nmu.airportticketoffice.entity.PassportData;
import ua.nmu.airportticketoffice.entity.Phone;
import ua.nmu.airportticketoffice.repository.ClientRepository;
import ua.nmu.airportticketoffice.service.ClientService;
import ua.nmu.airportticketoffice.service.PassportDataService;

import java.util.ArrayList;
import java.util.List;

@Service
public class ClientServiceImpl implements ClientService {

    @Autowired
    private ClientRepository clientRepository;

    @Autowired
    private PassportDataService passportDataService;

    @Override
    public List<Client> findAllByOrderByLastNameAsc() {
        return clientRepository.findAllByOrderByLastNameAsc();
    }

    @Override
    public Client findById(int id) {
        return clientRepository.findById(id).get();
    }

    @Override
    public void delete(Client client) {
        clientRepository.delete(client);
    }

    @Override
    public Client save(Client client) {
        return clientRepository.save(client);
    }

    @Override
    public Client save(
            PassportData passportData,
            Integer clientId,
            String lastName,
            String firstName,
            String patronymic,
            Integer[] ids,
            String[] phones
    ) {

        passportData = passportDataService.save(passportData);
        Client client = new Client();
        if (clientId != null) {
            client.setId(clientId);
        }
        client.setLastName(lastName);
        client.setFirstName(firstName);
        client.setPatronymic(patronymic);
        client.setPassportData(passportData);

        List<Phone> clientPhones = new ArrayList<>(phones.length);

        for (int i = 0; i < phones.length; i++) {
            Phone phone = new Phone();
            if (ids != null && i < ids.length) {
                phone.setId(ids[i]);
            } else {
                phone.setId(0);
            }
            phone.setPhone(phones[i]);
            phone.setClient(client);
            clientPhones.add(phone);
        }
        client.setPhones(clientPhones);

        return clientRepository.save(client);
    }

    @Override
    public List<Client> saveAll(List<Client> clients) {
        return clientRepository.saveAll(clients);
    }

    @Override
    public List<Client> findAll() {
        return clientRepository.findAll();
    }

    @Override
    public void deleteById(int id) {
        clientRepository.deleteById(id);
    }
}
