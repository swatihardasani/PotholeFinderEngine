package com.pothole.engine;


//import com.pothole.engine.controller.UserController;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
//import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
//@ComponentScan(basePackageClasses = UserController.class)
public class AccessingDataMysqlApplication {

    public static void main(String[] args) {
        SpringApplication.run(AccessingDataMysqlApplication.class, args);
    }

}