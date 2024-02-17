#!/bin/bash

create_student() {
    echo "Enter student email:"
    read email

    echo "Enter student age:"
    read age

    echo "Enter student ID:"
    read student_id

    echo "$email,$age,$student_id" >> students-list_1023.txt
    echo "Student record created successfully!"
}

view_students() {
    echo "List of all students:"
    cat students-list_1023.txt
}

delete_student() {
    echo "Enter student ID to delete:"
    read student_id

    # Check if the student ID exists in the file
    if grep -q "$student_id" students-list_1023.txt; then
        # Delete the student record
        sed -i "/$student_id/d" students-list_1023.txt
        echo "Student with ID $student_id deleted successfully!"
    else
        echo "Error: Student with ID $student_id does not exist."
    fi
}

update_student() {
    echo "Enter the student ID to update:"
    read student_id

    sed -i "/$student_id/{
        s/^.*$/$(create_student)/
    }" students-list_1023.txt

    echo "Student record updated successfully!"
}

select_student_emails() {
    ./select-emails.sh
}

exit_application() {
    echo "Exiting the application.Bye!"
    exit 0
}

# Menu for the application
while true; do
    echo "------------------"
    echo "ALU Registration System"
    echo "------------------"
    echo "1. Create Student Record"
    echo "2. View Students"
    echo "3. Delete Student"
    echo "4. Update Student Record"
    echo "5. Select Student Emails"
    echo "6. Exit"
    read choice

    case $choice in
        1) create_student;;
        2) view_students;;
        3) delete_student;;
        4) update_student;;
	5) select_student_emails;;
        6) exit_application;;
        *) echo "Invalid choice. Please choose a valid option.";;
    esac
done
