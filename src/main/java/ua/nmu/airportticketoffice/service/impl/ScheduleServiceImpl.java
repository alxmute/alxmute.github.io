package ua.nmu.airportticketoffice.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ua.nmu.airportticketoffice.entity.Schedule;
import ua.nmu.airportticketoffice.repository.ScheduleRepository;
import ua.nmu.airportticketoffice.service.ScheduleService;

import java.sql.Date;
import java.util.List;

@Service
public class ScheduleServiceImpl implements ScheduleService {

    @Autowired
    private ScheduleRepository scheduleRepository;

    @Override
    public Schedule save(Schedule schedule) {
        return scheduleRepository.save(schedule);
    }

    @Override
    public List<Schedule> saveAll(List<Schedule> schedules) {
        return scheduleRepository.saveAll(schedules);
    }

    @Override
    public List<Schedule> findAll() {
        return scheduleRepository.findAll();
    }

    @Override
    public List<Schedule> findAllByDepartureCityAndArrivalCityAndTimeLike(
            int departureCityId, int arrivalCityId, Date date
    ) {

        return scheduleRepository
                .findAllByDepartureCityAndArrivalCityAndTimeLike(departureCityId, arrivalCityId, date);
    }

    @Override
    public Schedule findById(int id) {
        return scheduleRepository.findById(id).get();
    }

    @Override
    public void delete(Schedule schedule) {
        scheduleRepository.delete(schedule);
    }

    @Override
    public void deleteById(int id) {
        scheduleRepository.deleteById(id);
    }
}
