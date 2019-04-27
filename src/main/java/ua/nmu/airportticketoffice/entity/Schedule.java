package ua.nmu.airportticketoffice.entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import java.math.BigDecimal;
import java.sql.Time;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "schedule")
@NoArgsConstructor
@ToString(of = {"id"})
public class Schedule {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Getter
    @Setter
    private int id;

    @Getter
    @Setter
    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "flight_id")
    private Flight flight;

    @Getter
    @Setter
    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "airplane_id")
    private Airplane airplane;

    @Getter
    @Setter
    @Column(name = "departure_date")
    private Date departureDate;

    @Getter
    @Setter
    @Column(name = "time")
    private Time time;

    @Getter
    @Setter
    @Column(name = "price", precision = 10, scale = 2)
    private BigDecimal price;
}
