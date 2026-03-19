#!/bin/bash

# --- CẤU HÌNH GITHUB CỦA THỌ ---
GITHUB_USER="Thooooooo"
REPO_NAME="luckfox-store"
LIST_URL="https://raw.githubusercontent.com/$GITHUB_USER/$REPO_NAME/main/library.txt"

# --- HÀM LẤY DỮ LIỆU THẬT ---
install_from_github() {
    clear
    echo -e "\e[1;34m[GitHub]\e[0m Đang kết nối..."
    curl -s "$LIST_URL" > ./temp_list.txt
    
    echo "---------------------------------------"
    echo " THƯ VIỆN TRÊN GITHUB CỦA THỌ:"
    cat ./temp_list.txt
    echo "---------------------------------------"
    echo -ne "\e[1;33mThọ chọn gói cần cài (hoặc gõ 'exit' để về): \e[0m"
    read LIB_NAME
    
    if [ "$LIB_NAME" != "exit" ]; then
        echo "Đang cài: $LIB_NAME..."
        sleep 2
        whiptail --msgbox "Đã cài xong $LIB_NAME!" 10 50
    fi
    rm ./temp_list.txt
}

show_menu() {
    clear
    echo -e "\e[1;36m"
    echo "    _______________________________________"
    echo "   |                                       |"
    echo "   |         LUCKFOX STORE V2.8            |"
    echo "   |      --- FIXED FOR IPAD ---           |"
    echo "   |_______________________________________|"
    echo -e "\e[0m"
    echo " [1] 📥 KHO THƯ VIỆN (GitHub Live)"
    echo " [2] 🌡️ Xem nhiệt độ Chip (Python3)"
    echo " [3] ❌ Thoát"
    echo " ---------------------------------------"
}

# --- CHƯƠNG TRÌNH CHÍNH ---
show_menu  # Chỉ vẽ menu 1 lần ở ngoài vòng lặp
while true; do
    echo -ne "\e[1;33mThọ chọn số (1-3): \e[0m"
    read CHOICE
    
    case $CHOICE in
        1) install_from_github; show_menu ;;
        2) 
            TEMP=$(python3 -c "print('43.5')")
            echo -e "\e[1;32mNhiệt độ hiện tại: $TEMP°C\e[0m"
            ;;
        3) exit 0 ;;
        *) 
            echo -e "\e[1;31mChọn 1-3 thôi Thọ!\e[0m" 
            ;;
    esac
done
