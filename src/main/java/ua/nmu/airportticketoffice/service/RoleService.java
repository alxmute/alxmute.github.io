package ua.nmu.airportticketoffice.service;

import ua.nmu.airportticketoffice.entity.Role;

import java.util.List;

public interface RoleService {
    Role save(Role role);

    List<Role> saveAll(List<Role> roles);

    List<Role> findAll();

    Role findById(int id);

    void delete(Role role);

    void deleteById(int id);
}
