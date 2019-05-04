package ua.nmu.airportticketoffice.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ua.nmu.airportticketoffice.entity.Seat;
import ua.nmu.airportticketoffice.repository.SeatRepository;
import ua.nmu.airportticketoffice.service.SeatService;

import java.util.List;

@Service
public class SeatServiceImpl implements SeatService {

    @Autowired
    private SeatRepository seatRepository;

    @Override
    public Seat save(Seat seat) {
        return seatRepository.save(seat);
    }

    @Override
    public List<Seat> saveAll(List<Seat> seats) {
        return seatRepository.saveAll(seats);
    }

    @Override
    public List<Seat> findAll() {
        return seatRepository.findAll();
    }

    @Override
    public Seat findById(int id) {
        return seatRepository.findById(id).get();
    }

    @Override
    public void delete(Seat seat) {
        seatRepository.delete(seat);
    }

    @Override
    public void deleteById(int id) {
        seatRepository.deleteById(id);
    }
}
