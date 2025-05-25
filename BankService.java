package edu.jspider.springmvc.Service;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import edu.jspider.springmvc.DAO.BankDAO;
import edu.jspider.springmvc.DTO.BankDTO;
import edu.jspider.springmvc.DTO.TransactionDTO;



//import java.time.LocalDateTime;
//import java.util.List;
//import edu.jspider.springmvc.DTO.TransactionDTO;


@Component
public class BankService {

	@Autowired
	private BankDAO bankDAO;
	
	
	public boolean userAdded(String name, int accountNumber, double balance, String accountType) {
	    BankDTO bankDTO = new BankDTO();
	    bankDTO.setName(name);
	    bankDTO.setAccountNumber(accountNumber);
	    bankDTO.setBalance(balance);
	    bankDTO.setAccountType(accountType);

	    try {
	        bankDAO.addUser(bankDTO);
	        return true;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    }
	}


	public BankDTO authenticateUser(String name, int accountNumber) {
		try {
			BankDTO authenticatedUser = bankDAO.authenticateUser(name,accountNumber);
			if(authenticatedUser.getName().equals(name) && authenticatedUser.getAccountNumber() == accountNumber)
				return authenticatedUser;
			else
				return null;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
		
	}
	public boolean depositMoney(int accountNumber, double amount) {
	    try {
	        return bankDAO.depositAmount(accountNumber, amount);
	    } catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    }
	}

	public BankDTO getUserByAccountNumber(int accountNumber) {
	    return bankDAO.getUserByAccountNumber(accountNumber);
	}

	
	public boolean withdrawMoney(int accountNumber, double amount) {
	    BankDTO user = bankDAO.getUserByAccountNumber(accountNumber);
	    if (user != null && user.getBalance() >= amount) {
	        user.setBalance(user.getBalance() - amount);
	        return bankDAO.updateUser(user);
	    }
	    return false;
	}


	
	public boolean deleteUser(int id) {
		try {
			bankDAO.deleteUser(id);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	public BankDTO findUserById(int id) {
		return bankDAO.findUserById(id);
	}
	
	public boolean updateUser(int id, String name ,int accountNumber,double balance, String accountType) {
		try {
			bankDAO.updateUser(id, name, accountNumber, balance,accountType);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	
	
	
	
	
	public boolean depositMoney1(int accountNumber, double amount) {
	    boolean status = bankDAO.depositAmount(accountNumber, amount);
	    if (status) {
	        // Record transaction
	        TransactionDTO txn = new TransactionDTO();
	        txn.setAccountNumber(accountNumber);
	        txn.setAmount(amount);
	        txn.setTransactionType("Deposit");
	        txn.setTimestamp(LocalDateTime.now());
	        bankDAO.recordTransaction(txn);
	    }
	    return status;
	}

	public boolean withdrawMoney1(int accountNumber, double amount) {
	    BankDTO user = bankDAO.getUserByAccountNumber(accountNumber);
	    if (user != null && user.getBalance() >= amount) {
	        user.setBalance(user.getBalance() - amount);
	        boolean updated = bankDAO.updateUser(user);
	        if (updated) {
	            // Record transaction
	            TransactionDTO txn = new TransactionDTO();
	            txn.setAccountNumber(accountNumber);
	            txn.setAmount(amount);
	            txn.setTransactionType("Withdraw");
	            txn.setTimestamp(LocalDateTime.now());
	            bankDAO.recordTransaction(txn);
	        }
	        return updated;
	    }
	    return false;
	}

	public List<TransactionDTO> getTransactionHistory(int accountNumber) {
	    return bankDAO.getTransactionsByAccountNumber(accountNumber);
	}
}
