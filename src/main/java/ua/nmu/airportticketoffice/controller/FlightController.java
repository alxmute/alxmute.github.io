package ua.nmu.airportticketoffice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import ua.nmu.airportticketoffice.entity.City;
import ua.nmu.airportticketoffice.entity.Schedule;
import ua.nmu.airportticketoffice.repository.CityRepository;
import ua.nmu.airportticketoffice.repository.ScheduleRepository;

import java.sql.Date;
import java.util.List;

@Controller
@RequestMapping("/flights")
public class FlightController {

    @Autowired
    private ScheduleRepository scheduleRepository;

    @Autowired
    private CityRepository cityRepository;


    @GetMapping("/list")
    public String listFlights(
            Model model,
            @RequestParam Integer from,
            @RequestParam Integer to,
            @RequestParam String date
    ) {
        List<City> cities = cityRepository.findAllByOrderByNameAsc();

        model.addAttribute("cities", cities);

        if (from != null && to != null && date != null){
            List<Schedule> schedules = scheduleRepository.findAllByDepartureCityAndArrivalCityAndTimeLike(from, to, Date.valueOf(date));
            model.addAttribute("schedules", schedules);
        }

        return "/flights/search-flights";
    }


    @GetMapping("/search")
    public String searchFlights(Model model) {
        List<City> cities = cityRepository.findAllByOrderByNameAsc();

        model.addAttribute("cities", cities);

        return "/flights/search-flights";
    }

    @GetMapping("/schedule")
    public String fullSchedule(Model model) {
        List<Schedule> schedules = scheduleRepository.findAll();

        model.addAttribute("schedules", schedules);

        return "/flights/schedule";
    }

}
