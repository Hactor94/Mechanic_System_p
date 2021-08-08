package com.example.demo.service;

import org.springframework.boot.CommandLineRunner;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import com.example.demo.model.Mechanic;
import com.example.demo.dao.Mechanic_Repo;

@Service
public class DbInit implements CommandLineRunner {
	private Mechanic_Repo Mechanic_Repo;
    private PasswordEncoder passwordEncoder;

    public DbInit(Mechanic_Repo Mechanic_Repo, PasswordEncoder passwordEncoder) {
        this.Mechanic_Repo = Mechanic_Repo;
        this.passwordEncoder = passwordEncoder;
    }

    @Override
    public void run(String... args) {
        //Delete all
        this.Mechanic_Repo.deleteAll();
        
        //Create users
        Mechanic mechanic1 = new Mechanic(215667308,"Tholinhlanhla" ,"Hlophe", null, "0728108800", "mkhonkosi28@gmail.com", "Male", passwordEncoder.encode("Nhlanhla.94"), "true", 1, "ADMIN, MECHANIC", "ADMIN, MECHANIC");
        Mechanic mechanic2 = new Mechanic(214612976,"Thapelo" ,"Ramashala", null, "0729698263", "tgramashala@gmail.com", "Male", passwordEncoder.encode("Thapelo.96"), "true", 1, "ADMIN, MECHANIC", "ADMIN, MECHANIC");
        Mechanic mechanic3 = new Mechanic(215000524,"Katlego" ,"Moima", null, "0715406987", "moimakatlego2@gmail.com", "Female", passwordEncoder.encode("Katlego.95"), "true", 1, "ADMIN, MECHANIC", "ADMIN, MECHANIC");
        Mechanic mechanic4 = new Mechanic(217450985,"Stephanie" ,"Malepe", null, "0672476347", "moloromalepe17@gmail.com", "Female", passwordEncoder.encode("Stephanie.97"), "true", 1, "ADMIN, MECHANIC", "ADMIN, MECHANIC");        
        Mechanic mechanic5 = new Mechanic(216770100,"Thabiso" ,"Manamela", null, "0728108801", "thabisomanamela@gmail.com", "Male", passwordEncoder.encode("Mechanic.22"), "true", 1, "MECHANIC", "MECHANIC");
        Mechanic mechanic6 = new Mechanic(216770101,"Mnotho" ,"Masangu", null, "0728108802", "mnothomasangu@gmail.com", "Male", passwordEncoder.encode("Mechanic.22"), "true", 1, "MECHANIC", "MECHANIC");
        Mechanic mechanic7 = new Mechanic(216770102,"George" ,"Ngobeni", null, "0728108803", "georgeNgobeni89@gmail.com", "Female", passwordEncoder.encode("Mechanic.22"), "true", 1, "MECHANIC", "MECHANIC");
        Mechanic mechanic8 = new Mechanic(216770103,"Thabitha" ,"Akinpelu", null, "0728108804", "thabithaakipelu@gmail.com", "Female", passwordEncoder.encode("Mechanic.22"), "true", 1, "MECHANIC", "MECHANIC");        
        Mechanic mechanic9 = new Mechanic(216770104,"Tshego" ,"Madiba", null, "0728108805", "tshego1996@gmail.com", "Male", passwordEncoder.encode("Mechanic.22"), "true", 1, "MECHANIC", "MECHANIC");
        Mechanic mechanic10 = new Mechanic(216770105,"Mike" ,"Khumalo", null, "0728108806", "mikekhumalo@gmail.com", "Male", passwordEncoder.encode("Mechanic.22"), "true", 1, "MECHANIC", "MECHANIC");
        
        // Save to database
        this.Mechanic_Repo.save(mechanic1); 
        this.Mechanic_Repo.save(mechanic2);
        this.Mechanic_Repo.save(mechanic3); 
        this.Mechanic_Repo.save(mechanic4); 
        this.Mechanic_Repo.save(mechanic5); 
        this.Mechanic_Repo.save(mechanic6);
        this.Mechanic_Repo.save(mechanic7); 
        this.Mechanic_Repo.save(mechanic8);
        this.Mechanic_Repo.save(mechanic9); 
        this.Mechanic_Repo.save(mechanic10);
    }
}