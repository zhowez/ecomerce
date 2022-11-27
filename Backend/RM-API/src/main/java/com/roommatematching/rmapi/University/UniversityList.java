package com.roommatematching.rmapi.University;


import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
@Entity
public class UniversityList {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
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
