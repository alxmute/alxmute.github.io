package ua.nmu.airportticketoffice.entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.List;

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
    @OneToMany(mappedBy = "departureCity", cascade = CascadeType.ALL)
    private List<Flight> flight1;

    @Getter
    @Setter
    @OneToMany(mappedBy = "arrivalCity", cascade = CascadeType.ALL)
    private List<Flight> flight2;
}
