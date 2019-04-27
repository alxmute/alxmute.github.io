package ua.nmu.airportticketoffice.entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;

@Entity
@Table(name = "seats")
@NoArgsConstructor
@ToString(of = {"id", "seatNumber"})
public class Seat {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Getter
    @Setter
    private int id;

    @Getter
    @Setter
    @ManyToOne
    @JoinColumn(name = "airplane_id")
    private Airplane airplane;

    @Getter
    @Setter
    @Column(name = "seat_number")
    private int seatNumber;
}
