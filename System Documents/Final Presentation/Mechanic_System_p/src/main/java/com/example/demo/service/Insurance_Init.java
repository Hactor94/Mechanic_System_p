package com.example.demo.service;

import org.springframework.boot.CommandLineRunner;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.example.demo.model.Insurance_Company;
import com.example.demo.dao.Insurance_Company_Repo;

@Service
public class Insurance_Init implements CommandLineRunner {
	private Insurance_Company_Repo insurance_repo;
    private PasswordEncoder passwordEncoder;

    public Insurance_Init(Insurance_Company_Repo insurance_repo, PasswordEncoder passwordEncoder) {
        this.insurance_repo = insurance_repo;
        this.passwordEncoder = passwordEncoder;
    }

    @Override
    public void run(String... args) {
        //Delete all
        this.insurance_repo.deleteAll();

        //Create users
        Insurance_Company insurance1 = new Insurance_Company(215784490, "Trio Touch", "TrioTouch", "info@triotouch.com", "0112520660","155 Troye Str", "Pritoria", "South Africa", "0041", passwordEncoder.encode("Insurance.22"), "yes", 1, "INSURANCE", "INSURANCE");
        Insurance_Company insurance2 = new Insurance_Company(215784491, "Gigaba", "Gigaba", "info@gigaba.com", "0112520601","6 Prince street", "Johannesburg", "South Africa", "0020", passwordEncoder.encode("Insurance.22"), "yes", 1, "INSURANCE", "INSURANCE");
        Insurance_Company insurance3 = new Insurance_Company(215784492, "Khoza and Sons", "Khoza_Sons", "info@khozaandsons.com", "0112529664","404 Pretrious", "Pritoria", "South Africa", "0012", passwordEncoder.encode("Insurance.22"), "yes", 1, "INSURANCE", "INSURANCE");
        Insurance_Company insurance4 = new Insurance_Company(215784493, "Marobela", "Marobela", "info@marobela.com", "0112520668","156 Troye Str", "Johannesburg", "South Africa", "0002", passwordEncoder.encode("Insurance.22"), "yes", 1, "INSURANCE", "INSURANCE");
        Insurance_Company insurance5 = new Insurance_Company(215784494, "InsuranceSys", "InsuranceSys", "info@insurancesys.com", "0112570670","153 Celliers Street", "Pritoria", "South Africa", "0009", passwordEncoder.encode("Insurance.22"), "yes", 1, "INSURANCE", "INSURANCE");
        Insurance_Company insurance6 = new Insurance_Company(215784495, "AmazonInsu", "AmazonInsu", "info@amazoninsu.com", "0112523669","111 Troye Str", "Johannesburg", "South Africa", "0008", passwordEncoder.encode("Insurance.22"), "yes", 1, "INSURANCE", "INSURANCE");
        Insurance_Company insurance7 = new Insurance_Company(215784496, "InsuMeNow", "InsuMeNow", "info@insumenow.com", "0112523781","248 Lilian Street", "Piet Retief", "South Africa", "2380", passwordEncoder.encode("Insurance.22"), "yes", 1, "INSURANCE", "INSURANCE");
        Insurance_Company insurance8 = new Insurance_Company(215784497, "MyCarPlan", "MyCarPlan", "info@mycarplan.com", "0112533745","296 Mandela Street", "Johannesburg", "South Africa", "0004", passwordEncoder.encode("Insurance.22"), "yes", 1, "INSURANCE", "INSURANCE");
        Insurance_Company insurance9 = new Insurance_Company(215784498, "Best Car Insurance", "best_car_insurance", "info@bestcarinsurance.com", "0112515446","101 Malebo Street", "Piet Retief", "South Africa", "2380", passwordEncoder.encode("Insurance.22"), "yes", 1, "INSURANCE", "INSURANCE");
        Insurance_Company insurance10 = new Insurance_Company(215784499, "Car Home", "car_home", "info@carhome.com", "0112584421","125 Sapelo Street", "Pritoria", "South Africa", "0002", passwordEncoder.encode("Insurance.22"), "yes", 1, "INSURANCE", "INSURANCE");

        // Save to database
        this.insurance_repo.save(insurance1);
        this.insurance_repo.save(insurance2);
        this.insurance_repo.save(insurance3);
        this.insurance_repo.save(insurance4);
        this.insurance_repo.save(insurance5);
        this.insurance_repo.save(insurance6);
        this.insurance_repo.save(insurance7);
        this.insurance_repo.save(insurance8);
        this.insurance_repo.save(insurance9);
        this.insurance_repo.save(insurance10);
    }
}