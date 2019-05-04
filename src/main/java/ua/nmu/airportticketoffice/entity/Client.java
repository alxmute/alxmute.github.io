package ua.nmu.airportticketoffice.entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "clients")
@NoArgsConstructor
@ToString(of = {"id", "lastName", "firstName", "patronymic"})
public class Client {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Getter
    @Setter
    private int id;

    @Getter
    @Setter
    @Column(name = "first_name")
    private String firstName;

    @Getter
    @Setter
    @Column(name = "last_name")
    private String lastName;

    @Getter
    @Setter
    @Column(name = "patronymic")
    private String patronymic;

    @Getter
    @Setter
    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "passport_data_id")
    private PassportData passportData;

    @Getter
    @Setter
    @OneToMany(fetch = FetchType.LAZY,
            mappedBy = "client",
            cascade  = CascadeType.ALL,
            orphanRemoval = true
    )
    private List<Phone> phones;

    @Getter
    @Setter
    @OneToMany(fetch = FetchType.LAZY,
            mappedBy = "client",
            cascade  = CascadeType.ALL
    )
    private List<Ticket> tickets;
}
