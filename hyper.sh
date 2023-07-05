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

function1() {
    uname -on
}

function2() {
    whoami
}

function3() {
    while true
    do
        file_list=(*)
        echo -e "\nThe list of files and directories:"
        for item in "${file_list[@]}"; do
            if [[ -f "$item" ]]; then
                echo "F $item"
            elif [[ -d "$item" ]]; then
                echo "D $item"
            fi
        done
        echo -e "\n"
        echo "---------------------------------------------------"
        echo "| 0 Main menu | 'up' To parent | 'name' To select |"
        echo "---------------------------------------------------"
        read choice
        case $choice in
            0)
                # Exits Program
                break
                ;;        

            'up')
                # Provides OS Info
                function3_to_parent
                ;;
            *)
                # Provides User info
                echo "here"
                function3_to_select $choice
                ;;

        esac
    done
}

function3_to_parent() {
        echo "Not implemented!"
}

function3_to_select(){
    found=false
    file_list=(*)
    for item in "${file_list[@]}"; do
        if [[ "$item" == "$1" ]]; then
            found=true
            break
        fi
    done
    if $found; then
        echo "Not implemented!"
    else
        echo "Invalid input!"
    fi
}

selection() {
    
case $1 in
    0)
        # Exits Program
        echo "Farewell!"
        return 0
        ;;        

    1)
        # Provides OS Info
        function1
        ;;
    2)
        # Provides User info
        function2
        ;;

    3)
        # File and Directory Operations
        function3
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
