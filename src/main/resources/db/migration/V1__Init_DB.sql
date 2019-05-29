CREATE SEQUENCE airplane_id_seq start 4 increment 1;
CREATE TABLE airplanes
(
  id   integer               NOT NULL DEFAULT nextval('airplane_id_seq'),
  name character varying(45) NOT NULL,
  PRIMARY KEY (id)
);
ALTER SEQUENCE airplane_id_seq OWNED BY airplanes.id;

CREATE SEQUENCE passport_data_id_seq start 19 increment 1;
CREATE TABLE passport_data
(
  id           integer                NOT NULL DEFAULT nextval('passport_data_id_seq'),
  series       character varying(2)   NOT NULL,
  number       character varying(6)   NOT NULL,
  birthdate    date                   NOT NULL,
  birth_place  character varying(45)  NOT NULL,
  sex          character varying(6)   NOT NULL,
  issue_place  character varying(45)  NOT NULL,
  issue_date   date                   NOT NULL,
  registration character varying(100) NOT NULL,
  PRIMARY KEY (id)
);
ALTER SEQUENCE passport_data_id_seq OWNED BY passport_data.id;

CREATE SEQUENCE client_id_seq start 30 increment 1;
CREATE TABLE clients
(
  id               integer               NOT NULL DEFAULT nextval('client_id_seq'),
  last_name        character varying(45) NOT NULL,
  first_name       character varying(45) NOT NULL,
  patronymic       character varying(45) NOT NULL,
  passport_data_id integer               NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT passport_data_id_fk FOREIGN KEY (passport_data_id) REFERENCES passport_data (id)
);
ALTER SEQUENCE client_id_seq OWNED BY clients.id;

CREATE SEQUENCE country_id_seq start 4 increment 1;
CREATE TABLE countries
(
  id   integer               NOT NULL DEFAULT nextval('country_id_seq'),
  name character varying(45) NOT NULL,
  PRIMARY KEY (id)
);
ALTER SEQUENCE country_id_seq OWNED BY countries.id;

CREATE SEQUENCE city_id_seq start 10 increment 1;
CREATE TABLE cities
(
  id         integer               NOT NULL DEFAULT nextval('city_id_seq'),
  name       character varying(45) NOT NULL,
  country_id integer               NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT country_id_fk FOREIGN KEY (country_id) REFERENCES countries (id)
);
ALTER SEQUENCE city_id_seq OWNED BY cities.id;

CREATE SEQUENCE flight_id_seq start 19 increment 1;
CREATE TABLE flights
(
  id                integer NOT NULL DEFAULT nextval('flight_id_seq'),
  departure_city_id integer NOT NULL,
  arrival_city_id   integer NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT arrival_city_id_fk FOREIGN KEY (arrival_city_id) REFERENCES cities (id),
  CONSTRAINT departure_city_id_fk FOREIGN KEY (departure_city_id) REFERENCES cities (id)
);
ALTER SEQUENCE flight_id_seq OWNED BY flights.id;

CREATE SEQUENCE phone_id_seq start 30 increment 1;
CREATE TABLE phones
(
  id        integer               NOT NULL DEFAULT nextval('phone_id_seq'),
  phone     character varying(45) NOT NULL,
  client_id integer                        DEFAULT NULL,
  PRIMARY KEY (id),
  CONSTRAINT client_id_fk FOREIGN KEY (client_id) REFERENCES clients (id)
);
ALTER SEQUENCE phone_id_seq OWNED BY phones.id;

CREATE SEQUENCE role_id_seq start 3 increment 1;
CREATE TABLE roles
(
  id        integer                NOT NULL DEFAULT nextval('role_id_seq'),
  role_name character varying(255) NOT NULL,
  PRIMARY KEY (id)
);
ALTER SEQUENCE role_id_seq OWNED BY roles.id;

CREATE SEQUENCE schedule_id_seq start 17 increment 1;
CREATE TABLE schedule
(
  id             integer        NOT NULL DEFAULT nextval('schedule_id_seq'),
  flight_id      integer        NOT NULL,
  airplane_id    integer        NOT NULL,
  departure_date timestamp      NOT NULL,
  time           time           NOT NULL,
  price          decimal(10, 2) NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT airplane_id_in_schedule_fk FOREIGN KEY (airplane_id) REFERENCES airplanes (id),
  CONSTRAINT flight_id_fk FOREIGN KEY (flight_id) REFERENCES flights (id) ON DELETE CASCADE
);
ALTER SEQUENCE schedule_id_seq OWNED BY schedule.id;

CREATE SEQUENCE seat_id_seq start 329 increment 1;
CREATE TABLE seats
(
  id          integer NOT NULL DEFAULT nextval('seat_id_seq'),
  airplane_id integer NOT NULL,
  seat_number integer NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT airplane_id_fk FOREIGN KEY (airplane_id) REFERENCES airplanes (id)
);
ALTER SEQUENCE seat_id_seq OWNED BY seats.id;

CREATE SEQUENCE ticket_id_seq start 26 increment 1;
CREATE TABLE tickets
(
  id          integer   NOT NULL DEFAULT nextval('ticket_id_seq'),
  schedule_id integer   NOT NULL,
  client_id   integer   NOT NULL,
  seat_id     integer   NOT NULL,
  sale_date   timestamp NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT client_id_in_ticket_fk FOREIGN KEY (client_id) REFERENCES clients (id),
  CONSTRAINT seat_id_if FOREIGN KEY (seat_id) REFERENCES seats (id),
  CONSTRAINT schedule_id_fk FOREIGN KEY (schedule_id) REFERENCES schedule (id)
);
ALTER SEQUENCE ticket_id_seq OWNED BY tickets.id;

CREATE SEQUENCE user_id_seq start 5 increment 1;
CREATE TABLE users
(
  id       integer                NOT NULL DEFAULT nextval('user_id_seq'),
  username character varying(255) NOT NULL,
  password character varying(255) NOT NULL,
  active   boolean                NOT NULL,
  PRIMARY KEY (id)
);
ALTER SEQUENCE user_id_seq OWNED BY users.id;

CREATE TABLE users_roles
(
  user_id integer NOT NULL,
  role_id integer NOT NULL,
  PRIMARY KEY (user_id, role_id),
  CONSTRAINT role_id_fk FOREIGN KEY (role_id) REFERENCES roles (id),
  CONSTRAINT user_id_roles_fk FOREIGN KEY (user_id) REFERENCES users (id)
);
