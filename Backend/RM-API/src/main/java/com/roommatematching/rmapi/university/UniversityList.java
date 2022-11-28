package com.roommatematching.rmapi.university;


import jakarta.persistence.*;

@Entity
public class UniversityList {
    @Id
    @SequenceGenerator(name = "university_list_seq",
            sequenceName = "university_list_sequence",
            initialValue = 1, allocationSize = 20)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "university_list_seq")
    @Column(name = "University_ID", nullable = false)
    private Integer University_ID;

    private String University_Name;

    public Integer getId() {
        return University_ID;
    }

    public void setId(Integer id) {
        this.University_ID = id;
    }

    public String getUniversityName() {
        return University_Name;
    }

    public void setUniversityName(String name) {
        this.University_Name = name;
    }

}
