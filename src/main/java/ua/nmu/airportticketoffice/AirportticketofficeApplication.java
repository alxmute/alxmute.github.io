package ua.nmu.airportticketoffice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import ua.nmu.airportticketoffice.entity.Client;
import ua.nmu.airportticketoffice.repository.ClientRepository;

import java.util.Optional;

@SpringBootApplication
public class AirportticketofficeApplication {
    public static void main(String[] args) {
        SpringApplication.run(AirportticketofficeApplication.class, args);
    }
}
