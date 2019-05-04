package ua.nmu.airportticketoffice.service;

import org.springframework.security.core.userdetails.UserDetailsService;
import ua.nmu.airportticketoffice.entity.User;

import java.util.List;

public interface UserService extends UserDetailsService {
    User save(User user);

    List<User> saveAll(List<User> users);

    List<User> findAll();

    List<User> findAllByOrderByNameAsc();

    User findById(int id);

    User findByUsername(String username);

    void delete(User user);

    void deleteById(Integer id);
}
