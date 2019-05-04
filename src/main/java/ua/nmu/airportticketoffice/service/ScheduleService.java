package ua.nmu.airportticketoffice.service;

import ua.nmu.airportticketoffice.entity.Schedule;

import java.sql.Date;
import java.util.List;

public interface ScheduleService {
    Schedule save(Schedule schedule);

    List<Schedule> saveAll(List<Schedule> schedules);

    List<Schedule> findAll();

    List<Schedule> findAllByDepartureCityAndArrivalCityAndTimeLike(int departureCityId, int arrivalCityId, Date date);

    Schedule findById(int id);

    void delete(Schedule schedule);

    void deleteById(int id);
}
