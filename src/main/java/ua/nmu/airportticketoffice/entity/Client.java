package ua.nmu.airportticketoffice.entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "clients")
@NoArgsConstructor
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
            cascade  = CascadeType.ALL
    )
    private List<Phone> phones;

    public void addPhone(Phone phone) {
        if (phones == null) {
            phones = new ArrayList<>();
        }

        phones.add(phone);
        phone.setClient(this);
    }

    @Override
    public String toString() {
        return "Client{" +
                "id=" + id +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", patronymic='" + patronymic + '\'' +
                ", passportData=" + passportData +
                '}';
    }
}
