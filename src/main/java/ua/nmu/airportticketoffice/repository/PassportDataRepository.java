package ua.nmu.airportticketoffice.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ua.nmu.airportticketoffice.entity.PassportData;

public interface PassportDataRepository extends JpaRepository<PassportData,Integer> {
}
