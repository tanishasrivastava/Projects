import java.io.*;
import java.util.*;

class Customer implements Comparable<Customer> {
    private int customerId;
    private String name;

    public Customer(int customerId, String name) {
        this.customerId = customerId;
        this.name = name;
    }

    public int getCustomerId() {
        return customerId;
    }

    @Override
    public int compareTo(Customer other) {
        return Integer.compare(this.customerId, other.customerId);
    }

    @Override
    public String toString() {
        return customerId + "\t" + name;
    }
}

public class CustomerDataSortingAppp {
    public static void main(String[] args) {
        System.out.println("__________________________________________________________________________________________________");
        System.out.println("****** WELCOME TO THE CUSTOMER DATA SORTING APP.! ******");
        System.out.println(" ");
        System.out.println("--> This program allows you to enter the customer data  ");
        System.out.println("--> sorts it by Customer ID ");
        System.out.println("--> and saves the sorted data to a file (sorted_customer_data.txt) .");
        System.out.println("__________________________________________________________________________________________________");

        Scanner scanner = new Scanner(System.in);
        String inputFile = "customer_data.txt";
        String outputFile = "sorted_customer_data.txt";

        List<Customer> customers = new ArrayList<>();
        boolean continueAdding = true;

        while (continueAdding) {
            System.out.println(" ");
            System.out.print("--> Enter The Customer ID (integer): ");
            int customerId = scanner.nextInt();
            scanner.nextLine(); // Consume the newline character
            System.out.print("--> Enter The Customer Name: ");
            String name = scanner.nextLine();
            customers.add(new Customer(customerId, name));

            System.out.print("--> Do you want to add another customer? (yes/no): ");
            String response = scanner.nextLine().trim().toLowerCase();
            if (!response.equals("yes")) {
                continueAdding = false;
            }
        }

        scanner.close(); // Close the scanner to release system resources.

        System.out.println("\nCustomer Data Entered:");
        displayCustomerData(customers);

        saveCustomerDataToFile(customers, inputFile);
        quickSort(customers, 0, customers.size() - 1);

        System.out.println("\nCustomer Data Sorted:");
        displayCustomerData(customers);

        saveSortedCustomerDataToFile(customers, outputFile);

        System.out.println("\nCustomer data sorted and saved to " + outputFile);
    }

    public static void displayCustomerData(List<Customer> customers) {
        for (Customer customer : customers) {
            System.out.println(customer);
        }
    }

    public static void saveCustomerDataToFile(List<Customer> customers, String filename) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filename))) {
            for (Customer customer : customers) {
                writer.write(customer.toString() + "\n");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void saveSortedCustomerDataToFile(List<Customer> customers, String filename) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filename))) {
            for (Customer customer : customers) {
                writer.write(customer.toString() + "\n");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void quickSort(List<Customer> customers, int low, int high) {
        if (low < high) {
            int pivotIndex = partition(customers, low, high);
            quickSort(customers, low, pivotIndex - 1);
            quickSort(customers, pivotIndex + 1, high);
        }
    }

    public static int partition(List<Customer> customers, int low, int high) {
        Customer pivot = customers.get(high);
        int i = low - 1;

        for (int j = low; j < high; j++) {
            if (customers.get(j).compareTo(pivot) < 0) {
                i++;
                Collections.swap(customers, i, j);
            }
        }

        Collections.swap(customers, i + 1, high);
        return i + 1;
    }
}
