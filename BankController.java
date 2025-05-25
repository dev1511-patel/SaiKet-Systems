package edu.jspider.springmvc.Controller;
import java.util.List;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import edu.jspider.springmvc.DTO.BankDTO;
import edu.jspider.springmvc.DTO.TransactionDTO;
import edu.jspider.springmvc.Service.BankService;


//
//import java.util.List;
//import edu.jspider.springmvc.DTO.TransactionDTO;



@Controller
public class BankController {
	
	@Autowired
	private BankService bankService;
	

	
	@RequestMapping(path = "/add-user", method = RequestMethod.POST)
	protected String addUser(@RequestParam("name") String name,
	                         @RequestParam("accountNumber") int accountNumber,
	                         @RequestParam("balance") double balance,
	                         @RequestParam("accountType") String accountType,
	                         ModelMap modelMap) {

	    boolean userAdded = bankService.userAdded(name, accountNumber, balance, accountType);

	    if (userAdded) {
	        modelMap.addAttribute("message", "User added");
	        return "login_User";
	    } else {
	        modelMap.addAttribute("message", "Something went wrong");
	        return "sign_up_User";
	    }
	}
	
	@RequestMapping(path = "/auth-user", method = RequestMethod.POST)
	protected String authenticateUser(@RequestParam(name = "name" )String name, 
									@RequestParam(name = "accountNumber")int accountNumber
									,ModelMap modelMap ,HttpSession httpSession) {
		BankDTO authenticatedUser = bankService.authenticateUser(name,accountNumber);
		if(authenticatedUser != null)
		{
			httpSession.setAttribute("authenticated_user", authenticatedUser);
		return "home_User";
		}
		else
		{
			modelMap.addAttribute("message", "Invalid Name or Account Number");
			return"login_User";
		}
			
	}
	
	@RequestMapping(path = "/deposit", method = RequestMethod.POST)
	public String depositMoney(
	    @RequestParam(name = "accountNumber") int accountNumber,
	    @RequestParam(name = "amount") double amount,
	    ModelMap modelMap,
	    HttpSession session) {

	    boolean status = bankService.depositMoney(accountNumber, amount);

	    if (status) {
	        BankDTO updatedUser = bankService.getUserByAccountNumber(accountNumber);
	        session.setAttribute("authenticated_user", updatedUser);
	        modelMap.addAttribute("message", "Amount deposited successfully!");
	    } else {
	        modelMap.addAttribute("message", "Deposit failed.");
	    }

	    return "deposit_money";
	}

	
	@RequestMapping(path = "/withdraw", method = RequestMethod.POST)
	public String withdrawMoney(
	    @RequestParam(name = "accountNumber") int accountNumber,
	    @RequestParam(name = "amount") double amount,
	    ModelMap modelMap,
	    HttpSession session) {

	    boolean status = bankService.withdrawMoney(accountNumber, amount);

	    if (status) {
	        BankDTO updatedUser = bankService.getUserByAccountNumber(accountNumber);
	        session.setAttribute("authenticated_user", updatedUser);
	        modelMap.addAttribute("message", "Amount withdrawn successfully!");
	    } else {
	        modelMap.addAttribute("message", "Withdrawal failed. Insufficient balance or error.");
	    }

	    return "withdraw_money";
	}
	@RequestMapping(path = "/edit-user")
	protected String editUser(@RequestParam(name = "id") int id, ModelMap modelMap) {
		BankDTO user = bankService.findUserById(id);
		modelMap.addAttribute("user", user);
		return "edit_User";
	}


	@RequestMapping(path = "/updated-user")
	protected String updateUser(@RequestParam(name = "id") int id,
	                            @RequestParam(name = "name") String name,
	                            @RequestParam("accountNumber") int accountNumber,
	                            @RequestParam("balance") double balance,
	                            @RequestParam("accountType") String accountType,
	                            ModelMap modelMap,
	                            HttpSession session) {

	    boolean userUpdated = bankService.updateUser(id, name, accountNumber, balance, accountType);
	    
	    if (userUpdated) {
	        BankDTO updatedUser = bankService.findUserById(id);  // 🔁 Fetch updated user
	        session.setAttribute("authenticated_user", updatedUser);  // ✅ Store in session
	        modelMap.addAttribute("message", "User updated");
	    } else {
	        modelMap.addAttribute("message", "Something went wrong");
	    }

	    return "home_User";  // This now works safely
	}
	
	@RequestMapping(path = "/delete-user")
	protected String deleteUser(@RequestParam(name = "id") int id, ModelMap modelMap) {
		boolean userDeleted = bankService.deleteUser(id);
		if (userDeleted) {
			modelMap.addAttribute("message", "User deleted");
			return "login_User";
		} else {
			modelMap.addAttribute("message", "Something went wrong");
			return "home_User";
		}
	}
	
	@RequestMapping(path = "/logout-user")
	protected String logout(HttpSession httpSession) {
		httpSession.invalidate();
		return "login_User";
	}
	
	
	
	
	
	
	
	@RequestMapping(path = "/transaction-history", method = RequestMethod.GET)
	public String transactionHistory(HttpSession session, ModelMap modelMap) {
	    BankDTO user = (BankDTO) session.getAttribute("authenticated_user");
	    if (user != null) {
	        List<TransactionDTO> history = bankService.getTransactionHistory(user.getAccountNumber());
	        modelMap.addAttribute("transactions", history);
	        return "transaction_history"; // JSP page to create
	    } else {
	        modelMap.addAttribute("message", "Please login first.");
	        return "login_User";
	    }
	}
	
	

}
