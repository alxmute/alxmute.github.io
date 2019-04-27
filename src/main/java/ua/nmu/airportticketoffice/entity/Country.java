package ua.nmu.airportticketoffice.entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "countries")
@NoArgsConstructor
public class Country {

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
    @OneToMany(
            fetch = FetchType.LAZY,
            mappedBy = "country",
            cascade = CascadeType.ALL
    )
    private List<City> cities;
}
