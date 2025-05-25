package edu.jspider.springmvc.DAO;

import java.util.List;


//import java.util.List;


import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;

import org.springframework.stereotype.Component;

//import com.mysql.cj.x.protobuf.MysqlxCursor.Open;
//
//import edu.jspider.springmvc.DTO.Admin;
import edu.jspider.springmvc.DTO.BankDTO;
//import edu.jspider.springmvc.DTO.TransactionDTO;
import edu.jspider.springmvc.DTO.TransactionDTO;


@Component
public class BankDAO {

	private EntityManagerFactory entityManagerFactory;
	private EntityManager entityManager;
	private EntityTransaction entityTransaction;
	
	
	public void open() {
		entityManagerFactory= Persistence.createEntityManagerFactory("springmvc");
		entityManager=entityManagerFactory.createEntityManager();
		entityTransaction= entityManager.getTransaction();
		
	}
	
	public void close() {
		if(entityManagerFactory != null)
		entityManagerFactory.close();
		if(entityManager != null)
			entityManager.close();
		if(entityTransaction != null)
			if(entityTransaction.isActive())
		entityTransaction.rollback();
	}
	
	public  void addUser(BankDTO bankDTO) {
		
		open();
		entityTransaction.begin();
		entityManager.persist(bankDTO);
		entityTransaction.commit();
		close();
		
		
	}

	public BankDTO authenticateUser(String name, int accountNumber) {
		open();
		Query query = entityManager.createQuery("SELECT bank FROM BankDTO bank WHERE bank.name = ?1 AND bank.accountNumber = ?2");
		query.setParameter(1, name);
		query.setParameter(2, accountNumber);
		BankDTO bankDTO= (BankDTO) query.getSingleResult();
		close();
		return bankDTO;
		
		 
	}
	public boolean depositAmount(int accountNumber, double amount) {
	    open();
	    try {
	        Query query = entityManager.createQuery("SELECT bank FROM BankDTO bank WHERE bank.accountNumber = ?1");
	        query.setParameter(1, accountNumber);
	        BankDTO user = (BankDTO) query.getSingleResult();

	        entityTransaction.begin();
	        user.setBalance(user.getBalance() + amount);
	        entityManager.merge(user);
	        entityTransaction.commit();
	        return true;
	    } catch (Exception e) {
	        e.printStackTrace();
	        if (entityTransaction.isActive()) entityTransaction.rollback();
	        return false;
	    } finally {
	        close();
	    }
	}

	public BankDTO getUserByAccountNumber(int accountNumber) {
	    open();
	    Query query = entityManager.createQuery("SELECT bank FROM BankDTO bank WHERE bank.accountNumber = ?1");
	    query.setParameter(1, accountNumber);
	    BankDTO user = (BankDTO) query.getSingleResult();
	    close();
	    return user;
	}
	



	public boolean updateUser(BankDTO user) {
	    try {
	        open();
	        entityTransaction.begin();
	        entityManager.merge(user);
	        entityTransaction.commit();
	        close();
	        return true;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    }
	}

	
	public void deleteUser(int id) {
		open();
		entityTransaction.begin();
		BankDTO userToBeDeleted = entityManager.find(BankDTO.class, id);
		entityManager.remove(userToBeDeleted);
		entityTransaction.commit();
		close();
	}
	public BankDTO findUserById(int id) {
		open();
		BankDTO user = entityManager.find(BankDTO.class, id);
		close();
		return user;
	}
	
	public void updateUser(int id, String name ,int accountNumber,double balance, String accountType) {
		open();
		entityTransaction.begin();
		BankDTO user = entityManager.find(BankDTO.class, id);
		user.setName(name);
		user.setAccountNumber(accountNumber);
		user.setBalance(balance);
		user.setAccountType(accountType);
		entityManager.persist(user);
		entityTransaction.commit();
		close();
	}
	
	
	
	
	
	
	
	
	public void recordTransaction(TransactionDTO transaction) {
	    open();
	    try {
	        entityTransaction.begin();
	        entityManager.persist(transaction);
	        entityTransaction.commit();
	    } catch (Exception e) {
	        e.printStackTrace();
	        if(entityTransaction.isActive())
	            entityTransaction.rollback();
	    } finally {
	        close();
	    }
	}

	@SuppressWarnings("unchecked")
	public List<TransactionDTO> getTransactionsByAccountNumber(int accountNumber) {
	    open();
	    List<TransactionDTO> transactions = null;
	    try {
	        Query query = entityManager.createQuery("SELECT transaction FROM TransactionDTO transaction WHERE transaction.accountNumber = :acc ORDER BY transaction.timestamp DESC");
	        query.setParameter("acc", accountNumber);
	        transactions = query.getResultList();
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        close();
	    }
	    return transactions;
	}
	}
