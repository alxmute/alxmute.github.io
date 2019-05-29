package ua.nmu.airportticketoffice.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import ua.nmu.airportticketoffice.entity.Schedule;

import java.sql.Date;
import java.util.List;

public interface ScheduleRepository extends JpaRepository<Schedule, Integer> {
    @Query(
            value = "SELECT * FROM schedule s " +
                    "JOIN flights f ON s.flight_id = f.id " +
                    "JOIN cities c1 ON f.departure_city_id = c1.id " +
                    "JOIN cities c2 ON f.arrival_city_id = c2.id " +
                    "WHERE f.departure_city_id = ?1 " +
                    "AND f.arrival_city_id = ?2 AND to_char(s.departure_date, 'YYYY-MM-DD') LIKE ?3%",
            nativeQuery = true
    )
    List<Schedule> findAllByDepartureCityAndArrivalCityAndTimeLike(int departureCityId, int arrivalCityId, Date date);
}
