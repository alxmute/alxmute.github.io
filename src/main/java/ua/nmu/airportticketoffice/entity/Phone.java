package ua.nmu.airportticketoffice.entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;

@Entity
@Table(name = "phones")
@NoArgsConstructor
@ToString(of = {"id", "phone"})
public class Phone {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    @Getter
    @Setter
    private int id;

    @Getter
    @Setter
    @Column(name = "phone")
    private String phone;

    @Getter
    @Setter
    @ManyToOne(cascade = {CascadeType.MERGE, CascadeType.DETACH, CascadeType.PERSIST, CascadeType.REFRESH})
    @JoinColumn(name = "client_id")
    private Client client;

}
