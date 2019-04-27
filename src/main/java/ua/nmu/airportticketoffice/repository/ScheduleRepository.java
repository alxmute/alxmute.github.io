package ua.nmu.airportticketoffice.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import ua.nmu.airportticketoffice.entity.Schedule;

import java.sql.Date;
import java.util.List;

public interface ScheduleRepository extends JpaRepository<Schedule, Integer> {
    @Query(
            value = "SELECT * FROM schedule s " +
                    "JOIN flights f on s.flight_id = f.id " +
                    "join cities c1 on f.departure_city_id = c1.id " +
                    "join cities c2 on f.arrival_city_id = c2.id " +
                    "where f.departure_city_id = ?1 and f.arrival_city_id = ?2 and s.departure_date like ?3%",
            nativeQuery = true)
    List<Schedule> findAllByDepartureCityAndArrivalCityAndTimeLike(int departureCityId, int arrivalCityId, Date date);
}
