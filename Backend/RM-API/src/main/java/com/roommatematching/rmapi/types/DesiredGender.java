package com.roommatematching.rmapi.types;
import jakarta.persistence.*;

@Entity
public class DesiredGender {
    @Id
    @SequenceGenerator(name = "desired_gender_seq",
            sequenceName = "desired_gender_sequence",
            initialValue = 5, allocationSize = 20)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "desired_gender_seq")
    @Column(name = "Gender_ID", nullable = false)
    private Integer Gender_ID;

    private String Gender;

    public Integer getGender_ID() {
        return this.Gender_ID;
    }

    public void setGender_ID(Integer gender_ID) {
        this.Gender_ID = gender_ID;
    }

    public void setGender(String gender) {
        this.Gender = gender;
    }

    public String getGender() {
        return this.Gender;
    }


}
