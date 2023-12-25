import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Scanner;

public class Phcaa {
    private static final String FILENAME = "productivity_calculator.txt";

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        boolean done = false;
        while (!done) {
            System.out.print("Please enter your username to login: ");
            String username = scanner.nextLine();
            System.out.print("Please enter your password: ");
            int password = scanner.nextInt();
            scanner.nextLine(); // consume the remaining newline character

            if (username.equals("user") && password == 12) {
                System.out.println("Login successful!");
                System.out.println("*******************WELCOME TO THE PRODUCTIVE HOURS CALCULATOR APP****************");
                System.out.println(" *** our app will help you to calculate the productive hours you had in your day***");
                System.out.println(" ");
                System.out.println("HOW TO USE OUR APP:");
                System.out.println(">>during your day, keep on adding the information about the tasks that you did.");
                System.out.println(">>at the end of your day you can see the total productive hours you had.");
                
                System.out.println("Choose an option:");
                System.out.println("1. Add task");
                System.out.println("2. Update task");
                System.out.println("3. Delete task");
                System.out.println("4. Display tasks");
                System.out.println("5. Calculate productive hours");
                System.out.println("6. Exit");

                int choice = scanner.nextInt();
                scanner.nextLine(); // consume the remaining newline character

                switch (choice) {
                    case 1:
                        addTask();
                        break;
                    case 2:
                        updateTask();
                        break;
                    case 3:
                        deleteTask();
                        break;
                    case 4:
                        displayTask();
                        break;
                    case 5:
                        calculateProductiveHours();
                        break;
                    case 6:
                        done = true;
                        break;
                    default:
                        System.out.println("Invalid choice, please try again.");
                        break;
                }
            } else {
                System.out.println("Invalid username or password, please try again.");
            }
        }
        scanner.close();
    }

    // addTask(): this function will add the task done to our file.
    private static void addTask() {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Enter the task name:");
        String taskName = scanner.nextLine();
        System.out.println("Is the task productive? (y/n):");
        char isProductive = scanner.nextLine().charAt(0);
        System.out.println("Enter the number of hours you worked on the task:");
        int hoursWorked = scanner.nextInt();

        try {
            FileWriter writer = new FileWriter(FILENAME, true);
            writer.write(taskName + "," + isProductive + "," + hoursWorked + "\n");
            writer.close();
            System.out.println("Task added successfully.");
        } catch (IOException e) {
            System.out.println("Error adding task: " + e.getMessage());
        }
    }

    // updateTask(): this function will update the task which is already added to our file.
   private static void updateTask() {
    Scanner scanner = new Scanner(System.in);
    System.out.println("Enter the task name you want to update:");
    String taskName = scanner.nextLine();

    try {
        File inputFile = new File(FILENAME);
        File tempFile = new File("temp.txt");
        Scanner reader = new Scanner(inputFile);
        FileWriter writer = new FileWriter(tempFile);
        boolean found = false;
        while (reader.hasNextLine()) {
            String line = reader.nextLine();
            if (line.startsWith(taskName + ",")) {
                System.out.println("Enter the new number of hours worked on the task:");
                int newHoursWorked = scanner.nextInt();
                scanner.nextLine(); // consume the remaining newline character
                String[] parts = line.split(",");
                String updatedLine = parts[0] + "," + newHoursWorked;
                writer.write(updatedLine + "\n");
                found = true;
            } else {
                writer.write(line + "\n");
            }
        }
        reader.close();
        writer.close();

        if (found) {
            inputFile.delete();
            tempFile.renameTo(inputFile);
            System.out.println("Task updated successfully.");
        } else {
            tempFile.delete();
            System.out.println("Task not found.");
        }
    } catch (IOException e) {
        System.out.println("Error updating task: " + e.getMessage());
    }
}

private static void deleteTask() {
    Scanner scanner = new Scanner(System.in);
    System.out.println("Enter the task name, you want to delete:");
    String taskName = scanner.nextLine();

    try {
        File inputFile = new File(FILENAME);
        File tempFile = new File("temp.txt");
        Scanner reader = new Scanner(inputFile);
        FileWriter writer = new FileWriter(tempFile);
        boolean found = false;
        while (reader.hasNextLine()) {
            String line = reader.nextLine();
            if (line.startsWith(taskName + ",")) {
                found = true;
                continue;
            }
            writer.write(line + "\n");
        }
        reader.close();
        writer.close();

        if (found) {
            inputFile.delete();
            tempFile.renameTo(inputFile);
            System.out.println("Task deleted successfully.");
        } else {
            tempFile.delete();
            System.out.println("Task not found.");
        }
    } catch (IOException e) {
        System.out.println("Error deleting task: " + e.getMessage());
    }
}
// displayTask(): this function will display all tasks which are added to our file.

private static void displayTask() {
    try {
        File file = new File(FILENAME);
        Scanner scanner = new Scanner(file);

        while (scanner.hasNextLine()) {
            String line = scanner.nextLine();
            String[] task = line.split(",");

            System.out.println("Task name: " + task[0]);
            System.out.println("Is the task productive? " + task[1]);
            System.out.println("Hours worked: " + task[2]);
            System.out.println("----------------------");
        }

        scanner.close();
    } catch (IOException e) {
        System.out.println("Error displaying tasks: " + e.getMessage());
    }
}
private static void calculateProductiveHours() {
    try {
        Scanner scanner = new Scanner(new File(FILENAME));
        int productiveHours = 0;
        while (scanner.hasNextLine()) {
            String line = scanner.nextLine();
            String[] taskInfo = line.split(",");
            char isProductive = taskInfo[1].charAt(0);
            int hoursWorked = Integer.parseInt(taskInfo[2]);
            if (isProductive == 'y') {
                productiveHours += hoursWorked;
            }
        }
        scanner.close();
        System.out.println("You have worked " + productiveHours + " productive hours today.");
    } catch (IOException e) {
        System.out.println("Error reading file: " + e.getMessage());
    }
}
}
