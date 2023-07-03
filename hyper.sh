#! /usr/bin/env bash


#main display
display() {
    echo "------------------------------"
    echo "| Hyper Commander            |"
    echo "| 0: Exit                    |"
    echo "| 1: OS info                 |"
    echo "| 2: User info               |"
    echo "| 3: File and Dir operations |"
    echo "| 4: Find Executables        |"
    echo "------------------------------"
}

selection() {
    
case $1 in
    0)
        # Add your code for option 0 here
        echo "Farewell!"
        return 0
        ;;        

    1)
        # Add your code for option 1 here
        echo "Not implemented!"
        ;;
    2)
        # Add your code for option 2 here
        echo "Not implemented!"
        ;;

    3)
        # Add your code for option 3 here
        echo "Not implemented!"
        ;;
    4)
        # Add your code for option 3 here
        echo "Not implemented!"
        ;;        
    *)
        # Default Case
        echo "Invalid option!"
        ;;
esac
return 1
}

echo "Hello ${USER}!"
while true
do

    display
    read choice
    if selection $choice; then
        break
    fi
done
