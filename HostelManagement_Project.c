#include <stdio.h>
#include <stdlib.h>
#include <string.h>

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
    
    fp = fopen("hostel.txt", "a");
    if (fp == NULL) {
        printf("File can't be opened.\n");
        return;
    }

    printf("Enter student name: ");
    scanf("%s", add.name);
    printf("Enter student age: ");
    scanf("%d", &add.age);
    printf("Enter room number: ");
    scanf("%s", add.room_no);
    printf("Enter phone number: ");
    scanf("%d", &add.phone);
    printf("Enter roll number: ");
    scanf("%s", add.roll_no);

    fprintf(fp, "%s %d %s %d %s\n", add.name, add.age, add.room_no, add.phone, add.roll_no);

    fclose(fp);
    printf("\nStudent added successfully!\n");
}

void edit() {
    FILE *old, *newrec;
    Student check, upd;
    int choice, test = 0;

    old = fopen("hostel.txt", "r");
    newrec = fopen("new.txt", "w");

    if (old == NULL || newrec == NULL) {
        printf("File can't be opened.\n");
        return;
    }

    printf("Enter the roll no. of the student whose info you want to change: ");
    scanf("%s", upd.roll_no);

    while (fscanf(old, "%s %d %s %d %s\n", check.name, &check.age, check.room_no, &check.phone, check.roll_no) != EOF) {
        if (strcmp(check.roll_no, upd.roll_no) == 0) {
            test = 1;
            printf("Which information do you want to change?\n");
            printf("1. Name\n2. Age\n3. Room No\n4. Phone No\n5. All of the above\nEnter your choice: ");
            scanf("%d", &choice);

            if (choice == 1) {
                printf("Enter new name: ");
                scanf("%s", upd.name);
                fprintf(newrec, "%s %d %s %d %s\n", upd.name, check.age, check.room_no, check.phone, check.roll_no);
            } else if (choice == 2) {
                printf("Enter new age: ");
                scanf("%d", &upd.age);
                fprintf(newrec, "%s %d %s %d %s\n", check.name, upd.age, check.room_no, check.phone, check.roll_no);
            } else if (choice == 3) {
                printf("Enter new room number: ");
                scanf("%s", upd.room_no);
                fprintf(newrec, "%s %d %s %d %s\n", check.name, check.age, upd.room_no, check.phone, check.roll_no);
            } else if (choice == 4) {
                printf("Enter new phone number: ");
                scanf("%d", &upd.phone);
                fprintf(newrec, "%s %d %s %d %s\n", check.name, check.age, check.room_no, upd.phone, check.roll_no);
            } else if (choice == 5) {
                printf("Enter new name: ");
                scanf("%s", upd.name);
                printf("Enter new age: ");
                scanf("%d", &upd.age);
                printf("Enter new room number: ");
                scanf("%s", upd.room_no);
                printf("Enter new phone number: ");
                scanf("%d", &upd.phone);
                fprintf(newrec, "%s %d %s %d %s\n", upd.name, upd.age, upd.room_no, upd.phone, check.roll_no);
            }
            printf("Changes saved!\n");
        } else {
            fprintf(newrec, "%s %d %s %d %s\n", check.name, check.age, check.room_no, check.phone, check.roll_no);
        }
    }
    fclose(old);
    fclose(newrec);

    remove("hostel.txt");
    rename("new.txt", "hostel.txt");
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
