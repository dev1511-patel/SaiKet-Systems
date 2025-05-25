package Task;
//Task class representing a to-do item
public class Task {
	private String title;
    private boolean isCompleted;

    // Constructor
    public Task(String title) {
        this.title = title;
        this.isCompleted = false;
    }

    // Mark task as completed
    public void markAsCompleted() {
        this.isCompleted = true;
    }

    // Get task status
    public boolean isCompleted() {
        return isCompleted;
    }

    // Get task title
    public String getTitle() {
        return title;
    }

    // String representation of the task
    public String toString() {
        return (isCompleted ? "[✓] " : "[ ] ") + title;
    }
}


