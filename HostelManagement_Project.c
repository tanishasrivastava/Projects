#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Define the structure for student details
struct Student {
    char name[60];
    int age;
    char room_no[8];
    int phone;
    char roll_no[10];
};

typedef struct Student Student;

void view_stud() {
    FILE *fp;
    char ch;
    
    fp = fopen("hostel.txt", "r");
    if (fp == NULL) {
        printf("File can't be opened.\n");
        return;
    } else {
        printf("Contents of the file:\n");
    }

    do {
        ch = fgetc(fp);
        printf("%c", ch);
    } while (ch != EOF);

    fclose(fp);
}

void new_entry() {
    FILE *fp;
    Student add;
    Student check;
    
    fp = fopen("hostel.txt", "a+");
    if (fp == NULL) {
        printf("File can't be opened.\n");
        return;
    }

    // Your implementation for adding new student entries

    fclose(fp);
    printf("\nStudent added successfully!\n");
}

void edit() {
    FILE *old, *newrec;
    Student check;
    Student upd;
    int choice, test = 0;

    old = fopen("hostel.txt", "r");
    newrec = fopen("new.txt", "w");

    if (old == NULL || newrec == NULL) {
        printf("File can't be opened.\n");
        return;
    }

    // Your implementation for editing student information

    fclose(old);
    fclose(newrec);
    printf("\nChanges saved!\n");
}

int main() {
    int option;
    
    do {
        printf("\n*********** Hostel Management System ************\n");
        printf("1. View Student Records\n");
        printf("2. Add New Student Entry\n");
        printf("3. Edit Student Information\n");
        printf("4. Exit\n");
        printf("Enter your choice: ");
        scanf("%d", &option);

        switch (option) {
            case 1:
                view_stud();
                break;
            case 2:
                new_entry();
                break;
            case 3:
                edit();
                break;
            case 4:
                printf("Exiting...\n");
                break;
            default:
                printf("Invalid choice!\n");
                break;
        }
    } while (option != 4);

    return 0;
}
