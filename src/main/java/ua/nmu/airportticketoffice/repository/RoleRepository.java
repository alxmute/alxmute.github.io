package ua.nmu.airportticketoffice.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ua.nmu.airportticketoffice.entity.Role;

public interface RoleRepository extends JpaRepository<Role, Integer> {
}
