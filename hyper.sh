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
                function3_to_select $choice
                ;;

        esac
    done
}

function3_to_parent() {
    # move one directory up
    cd ..
}

function3_to_select() {
    if [[ -f $1 ]]; then
        function3_select_file $1
    elif [[ -d $1 ]]; then
        function3_select_directory $1
    else
        echo "Invalid input!"
    fi   
}
function3_select_directory() {
    cd $1
}
function3_select_file() {
    while true
    do
        echo "---------------------------------------------------------------------"
        echo "| 0 Back | 1 Delete | 2 Rename | 3 Make writable | 4 Make read-only |"
        echo "---------------------------------------------------------------------"
        read choice
        case $choice in
            0)
                # Back to file and dir menu
                return 0
                ;;        

            1)
                # delete file
                rm $1
                echo "$1 has been deleted."
                return 0
                ;;
            2)
                # rename file
                echo "Enter the new file name:"
                read new_name
                mv $1 $new_name
                echo "$1 has been renamed as $new_name"
                return 0
                ;;

            3)
                # make writable
                chmod 666 $1
                echo "Permissions have been updated."
                ls -l $1
                return 0
                ;;
            4)
                # make read only
                chmod 664 $1
                echo "Permissions have been updated."
                ls -l $1               
                return 0
                ;;        
            *)
                # Default Case
                continue
                ;;
        esac   
    done 
}
function4() {
    echo "Enter an executable name:"
    read exec_name
    # Store result of which in exec_path variable
    # 2>/dev/null used to clear out errors
    exec_path=$(which "$exec_name" 2>/dev/null)
    if [ -n $exec_path ]; then
        echo -e "Located in: $exec_path\n"
        echo "Enter arguments:"
        read arguments
        $exec_name $arguments
    else 
        echo "The executable with that name does not exist!"
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
            # Find Executables
            function4
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
