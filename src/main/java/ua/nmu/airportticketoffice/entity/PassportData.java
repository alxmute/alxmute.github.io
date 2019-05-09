package ua.nmu.airportticketoffice.entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.sql.Date;

@Entity
@Table(name = "passport_data")
@NoArgsConstructor
public class PassportData {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Getter
    @Setter
    private int id;

    @Column(name = "series")
    @Getter
    @Setter
    private String series;

    @Column(name = "number")
    @Getter
    @Setter
    private String number;

    @Column(name = "birthdate")
    @Getter
    @Setter
    private Date birthdate;

    @Column(name = "birth_place")
    @Getter
    @Setter
    private String birthPlace;

    @Column(name = "sex")
    @Getter
    @Setter
    private String sex;

    @Column(name = "issue_place")
    @Getter
    @Setter
    private String issuePlace;

    @Column(name = "issue_date")
    @Getter
    @Setter
    private Date issueDate;

    @Column(name = "registration")
    @Getter
    @Setter
    private String registration;

    @Getter
    @Setter
    @OneToOne(mappedBy = "passportData")
    private Client client;

    @Override
    public String toString() {
        return "PassportData{" +
                "id=" + id +
                ", series='" + series + '\'' +
                ", number=" + number +
                ", birthdate=" + birthdate +
                ", birthPlace='" + birthPlace + '\'' +
                ", sex=" + sex +
                ", issuePlace='" + issuePlace + '\'' +
                ", issueDate=" + issueDate +
                ", note='" + registration + '\'' +
                ", client id=" + client.getId() +
                '}';
    }
}
