package edu.jspider.springmvc.DTO;

import java.time.LocalDateTime;
import javax.persistence.*;

import lombok.Data;

@Entity
@Table(name = "transaction")
@Data
public class TransactionDTO {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(nullable = false)
    private int accountNumber;

    @Column(nullable = false)
    private String transactionType; // "Deposit" or "Withdraw"

    @Column(nullable = false)
    private double amount;

    @Column(nullable = false)
    private LocalDateTime timestamp;
}
