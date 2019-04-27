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

        //2019-06-15
        List<Schedule> schedules = scheduleRepository.findAllByDepartureCityAndArrivalCityAndTimeLike(from, to, Date.valueOf(date));
        model.addAttribute("schedules", schedules);

        System.out.println(schedules);

//        for (Schedule schedule : schedules){
//            System.out.println(schedule.getDepartureDate() + " " + schedule.getTime().getHour() + " hours " + schedule.getTime().getMinute() + " minutes");
//        }
        for (Schedule schedule : schedules){
            System.out.println(schedule.getDepartureDate() + " " + schedule.getTime().getHours() + " hours " + schedule.getTime().getMinutes() + " minutes");
        }

        return "/flights/list-flights";
    }


    @GetMapping("/search")
    public String searchFlights(Model model) {
        List<City> cities = cityRepository.findAllByOrderByNameAsc();

        model.addAttribute("cities", cities);

        return "/flights/list-flights";
    }

}
