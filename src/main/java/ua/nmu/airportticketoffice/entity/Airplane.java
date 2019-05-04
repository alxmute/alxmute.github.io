package ua.nmu.airportticketoffice.entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

@Entity
@Table(name = "airplanes")
@NoArgsConstructor
@ToString(of = {"id", "name"})
public class Airplane {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Getter
    @Setter
    private int id;

    @Getter
    @Setter
    @Column(name = "name")
    private String name;

    @Setter
    @OneToMany(mappedBy = "airplane", cascade = CascadeType.ALL)
    private List<Seat> seats;

    @Getter
    @Setter
    @OneToMany(mappedBy = "airplane", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<Schedule> schedules;

    public List<Seat> getSeats() {
        List<Seat> sortedSeats = seats;
        sortedSeats.sort(Comparator.comparing(Seat::getSeatNumber));
        return sortedSeats;
    }

    public List<Seat> getBusySeats(int scheduleId) {

        Schedule schedule = null;

        for (Schedule s : schedules) {
            if (s.getId() == scheduleId) {
                schedule = s;
            }
        }

        List<Seat> busySeats = new ArrayList<>(schedule.getTickets().size());

        for (Ticket t : schedule.getTickets()) {
            busySeats.add(t.getSeat());
        }

        return busySeats;
    }
}
