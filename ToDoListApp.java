package Task;

import java.util.ArrayList;
import java.util.Scanner;

public class ToDoListApp {
	
	    private static ArrayList<Task> tasks = new ArrayList<>();
	    private static Scanner scanner = new Scanner(System.in);

	    // Add a new task
	    public static void addTask() {
	        System.out.print("Enter task title: ");
	        String title = scanner.nextLine();
	        tasks.add(new Task(title));
	        System.out.println("Task added!");
	    }

	    // Mark a task as complete
	    public static void completeTask() {
	        viewTasks();
	        System.out.print("Enter task number to mark as complete: ");
	        int index = scanner.nextInt();
	        scanner.nextLine(); // clear newline

	        if (index > 0 && index <= tasks.size()) {
	            tasks.get(index - 1).markAsCompleted();
	            System.out.println("Task marked as completed.");
	        } else {
	            System.out.println("Invalid task number.");
	        }
	    }

	    // Display all tasks
	    public static void viewTasks() {
	        if (tasks.isEmpty()) {
	            System.out.println("No tasks found.");
	        } else {
	            System.out.println("\nTo-Do List:");
	            for (int i = 0; i < tasks.size(); i++) {
	                System.out.println((i + 1) + ". " + tasks.get(i));
	            }
	        }
	    }

	    // Main menu
	    public static void main(String[] args) {
	        while (true) {
	            System.out.println("\n--- To-Do List Menu ---");
	            System.out.println("1. Add Task");
	            System.out.println("2. View Tasks");
	            System.out.println("3. Complete Task");
	            System.out.println("4. Exit");
	            System.out.print("Choose an option: ");

	            int option = scanner.nextInt();
	            scanner.nextLine(); // clear newline

	            switch (option) {
	                case 1:
	                    addTask();
	                    break;
	                case 2:
	                    viewTasks();
	                    break;
	                case 3:
	                    completeTask();
	                    break;
	                case 4:
	                    System.out.println("Exiting. Goodbye!");
	                    return;
	                default:
	                    System.out.println("Invalid choice. Try again.");
	            }
	        }
	    }

	}


