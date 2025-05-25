package edu.jspider.springmvc.DTO;





import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import javax.persistence.Table;

import lombok.Data;
@Entity
@Table(name = "bank")
@Data
public class BankDTO {
	
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(nullable = false)
    private String name;

    @Column(nullable = false, unique = true)
    private int accountNumber;

    @Column(nullable = false)
    private double balance; // new field

    @Column(nullable = false)
    private String accountType; // new field (e.g., "Saving", "Current")
	
   

}
