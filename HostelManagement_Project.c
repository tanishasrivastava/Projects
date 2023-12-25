#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char ch;
struct {
    char name[60];
    int age;
    char room_no[8];
    int phone;
    char roll_no[10];
} hostel, add, check, upd, choice, rem;

// Function to view student records
void view_stud() {
    FILE *fp;
    fp = fopen("hostel.txt", "r");

    if (NULL == fp) {
        printf("File can't be opened.\n");
    } else {
        printf("Contents of the file:\n");
    }

    do {
        ch = fgetc(fp);
        printf("%c", ch);
    } while (ch != EOF);

    fclose(fp);
}

// Function to add new student entry
void new_entry() {
    FILE *fp;
    fp = fopen("hostel.txt", "a+");

    roll_no:
    printf("\n\t\t\t ADD STUDENTS DATA");
    printf("\nEnter your roll number:");
    scanf("%s", check.roll_no);

    while (fscanf(fp, "%s %d %s %d %s \n", add.name, &add.age, add.room_no, &add.phone, add.roll_no) != EOF) {
        if (strcmp(check.roll_no, add.roll_no) == 0) {
            printf("Student's roll no. already in use!");
            goto roll_no;
        }
    }

    strcpy(add.roll_no, check.roll_no);
    printf("\nEnter the name:");
    scanf("%s", add.name);
    printf("\nEnter the age:");
    scanf("%d", &add.age);
    printf("%s", add.room_no);
    printf("\nEnter the phone number: ");
    scanf("%d", &add.phone);
    fprintf(fp, "%s %d %s %d %s\n", add.name, add.age, add.room_no, add.phone, add.roll_no);

    fclose(fp);
    printf("\nStudent added successfully!");
}

// Function to edit student information
void edit() {
    int choice, test = 0;
    FILE *old, *newrec;

    old = fopen("hostel.txt", "r");
    newrec = fopen("new.txt", "w");

    printf("\nEnter the roll no. of the student whose info you want to change:");
    scanf("%s", upd.roll_no);

    while (fscanf(old, "%s %d %s %d %s\n", check.name, &check.age, check.room_no, &check.phone, check.roll_no) != EOF) {
        if (strcmp(check.roll_no, upd.roll_no) == 0) {
            test = 1;
            printf("\nWhich information do you want to change?");
            printf("\n1.Name\n2.Age\n3.Room No\n4.Phone No\n5.All of the above\nEnter your choice:");
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
            printf("Changes saved!");
        } else {
            fprintf(newrec, "%s %d %s %d %s\n", check.name, check.age, check.room_no, check.phone, check.roll_no);
        }
    }
    fclose(old);
    fclose(newrec);
   
