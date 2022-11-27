package com.roommatematching.rmapi;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;

//@SpringBootApplication
@SpringBootApplication(exclude = {SecurityAutoConfiguration.class })

public class RmApiApplication {

    public static void main(String[] args) {
        SpringApplication.run(RmApiApplication.class, args);
    }

}
