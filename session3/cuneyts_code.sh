#!/bin/bash
# Task: Write a script that uses as much of what we've covered to accomplish something creative.
# I tried to create intereactive log in file.
# this part to display usage message
usage() {
    echo "Please provide at least name, age, and city."
}
# this part prompt the user for missing information
prompt_for_input() {
    if [ -z "$NAME" ]; then
        read -p "Enter your name: " NAME
    fi
    if [ -z "$AGE" ]; then
        read -p "Enter your age: " AGE
    fi
    if [ -z "$CITY" ]; then
        read -p "Enter your city: " CITY
    fi
    if [ -z "$EMAIL" ]; then
        read -p "Enter your email (optional, press Enter to skip): " EMAIL
        EMAIL=${EMAIL:-"N/A"}  # Default to "N/A" if email is not provided
    fi
}
# this part is to validate the age
validate_age() {
    if ! [[ "$AGE" =~ ^[0-9]+$ ]]; then
        echo "Error: Age must be a number."
        return 1
    fi
    return 0
}
# this part to log user information
log_user_info() {
    LOGFILE="user_log.txt"
    echo "Script PID: $$, Number of arguments: $#" >> "$LOGFILE"
    echo "User Information:" >> "$LOGFILE"
    echo "Name: $NAME" >> "$LOGFILE"
    echo "Age: $AGE" >> "$LOGFILE"
    echo "City: $CITY" >> "$LOGFILE"
    echo "Email: $EMAIL" >> "$LOGFILE"
    echo "-------------------------" >> "$LOGFILE"
    echo "User information logged successfully!"
    echo "Log file location: $(pwd)/$LOGFILE"
}
# Main script logic
while true; do
    # Check if arguments are provided when running the script
    if [ "$#" -gt 0 ]; then
        if [ "$#" -lt 3 ]; then
            echo "You provided $# arguments, but at least 3 are required."
            usage
        else
            NAME=$1
            AGE=$2
            CITY=$3
            EMAIL=${4:-"N/A"}  # Default to "N/A" if email is not provided
        fi
    fi
    # If arguments are not provided or are insufficient, prompt for input
    if [ -z "$NAME" ] || [ -z "$AGE" ] || [ -z "$CITY" ]; then
        prompt_for_input
    fi
    # Validate the age (if age is provided)
    if [ -n "$AGE" ]; then
        if ! validate_age; then
            echo "Please try again or exit."
            read -p "Do you want to start over? (y/n): " TRY_AGAIN
            if [[ "$TRY_AGAIN" != "y" && "$TRY_AGAIN" != "Y" ]]; then
                echo "Exiting the script."
                exit 1
            else
                # Reset variables and try again
                NAME=""
                AGE=""
                CITY=""
                EMAIL=""
                continue
            fi
        fi
    fi
    # If all required fields are provided, log the information and exit
    if [ -n "$NAME" ] && [ -n "$AGE" ] && [ -n "$CITY" ]; then
        log_user_info
        break
    else
        echo "Please provide at least name, age, and city."
        read -p "Do you want to start over? (y/n): " TRY_AGAIN
        if [[ "$TRY_AGAIN" != "y" && "$TRY_AGAIN" != "Y" ]]; then
            echo "Exiting the script."
            exit 1
        else
            # Reset variables and try again
            NAME=""
            AGE=""
            CITY=""
            EMAIL=""
        fi
    fi
done
# Exit with success status
exit 0









