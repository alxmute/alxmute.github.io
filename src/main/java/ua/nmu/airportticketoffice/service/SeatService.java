package ua.nmu.airportticketoffice.service;

import ua.nmu.airportticketoffice.entity.Seat;

import java.util.List;

public interface SeatService {
    Seat save(Seat seat);

    List<Seat> saveAll(List<Seat> seats);

    List<Seat> findAll();

    Seat findById(int id);

    void delete(Seat seat);

    void deleteById(int id);
}
