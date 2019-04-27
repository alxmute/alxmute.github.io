package ua.nmu.airportticketoffice.entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name = "flights")
@NoArgsConstructor
public class Flight {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Getter
    @Setter
    private int id;

    @Getter
    @Setter
    @OneToOne
    @JoinColumn(name = "departure_city_id")
    private City departureCity;

    @Getter
    @Setter
    @OneToOne
    @JoinColumn(name = "arrival_city_id")
    private City arrivalCity;


}
