package ua.nmu.airportticketoffice;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import javax.annotation.PostConstruct;
import java.util.TimeZone;

@SpringBootApplication
public class AirportticketofficeApplication {
    public static void main(String[] args) {
        SpringApplication.run(AirportticketofficeApplication.class, args);
    }
    @PostConstruct
    public void init(){
        TimeZone.setDefault(TimeZone.getTimeZone("UTC"));   // It will set UTC timezone
    }
}


