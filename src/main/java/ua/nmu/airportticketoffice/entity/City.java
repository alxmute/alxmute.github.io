package ua.nmu.airportticketoffice.entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name = "cities")
@NoArgsConstructor
public class City {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Getter
    @Setter
    private int id;

    @Getter
    @Setter
    @Column(name = "name")
    private String name;

    @Getter
    @Setter
    @ManyToOne
    @JoinColumn(name = "country_id")
    private Country country;

    @Getter
    @Setter
    @OneToOne(mappedBy = "departureCity", cascade = CascadeType.ALL)
    private Flight flight1;

    @Getter
    @Setter
    @OneToOne(mappedBy = "arrivalCity", cascade = CascadeType.ALL)
    private Flight flight2;
}
