#include <stdio.h>
#include<stdlib.h>
#include<string.h>

char ch;
struct {

    char name[60];
    int age;
    char room_no[8];
    int phone;
    char roll_no[10];
    
    }hostel,add,check,upd,choice,rem;
    
//defining view_stud()  
void view_stud () {

 
 FILE *fp; 
 fp = fopen ("hostel. txt", "r");
 
    if (NULL == fp) {
        printf("file can't be opened \n");
    }
    else{
    printf("content of this file are \n");
    }
 
    // Printing what is written in file
    // character by character using loop.
    do {
        ch = fgetc(fp);
        printf("%c", ch);
 
        // Checking if character is not EOF.
        // If it is EOF stop reading.
    } while (ch != EOF);
 
    // Closing the file
    fclose(fp);
   
}
//defining void new_entry()
void new_entry()
{
    FILE *fp,*hostel;

    fp=fopen("hostel.txt","a+");
    roll_no:
    
    printf("\t\t\t ADD STUDENTS DATA");
    printf("\nEnter your roll number:");
    scanf("%s",check.roll_no);
    while(fscanf(fp,"%s %d %s %d %s \n",add.name, &add.age, add.room_no, &add.phone, add.roll_no)!=EOF)
    {
        if (strcmp(check.roll_no,add.roll_no)==0)
            {printf("Student's roll no. already in use!");
             goto roll_no;
        }
    }

    strcpy(add.roll_no,check.roll_no);
    printf("\nEnter the name:");
    scanf("%s",add.name);
    printf("\nEnter the age:");
    scanf("%d",&add.age);
    printf("%s",add.room_no);
    printf("\nEnter the phone number: ");
    scanf("%d",&add.phone);
        fprintf(fp,"%s %d %s %d %s\n",add.name,add.age,add.room_no,add.phone,add.roll_no);
	
		
    fclose(fp);
    printf("\nStudent added successfully!");
}
//defining void edit()
void edit()
{
    int choice,test=0;
    FILE *old,*newrec;
    old=fopen("record.dat","r");
    newrec=fopen("new.dat","w");

    printf("\nEnter the roll no. of the student whose info you want to change:");
    scanf("%s",upd.roll_no);
