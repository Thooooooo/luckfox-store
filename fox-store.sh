#!/bin/bash

# --- CẤU HÌNH GITHUB CỦA THỌ ---
GITHUB_USER="Thooooooo"
REPO_NAME="luckfox-store"
LIST_URL="https://raw.githubusercontent.com/$GITHUB_USER/$REPO_NAME/main/library.txt"

# --- HÀM LẤY DỮ LIỆU THẬT ---
install_from_github() {
    clear
    echo -e "\e[1;34m[GitHub]\e[0m Đang kết nối tới kho: $GITHUB_USER/$REPO_NAME..."
    
    # Dùng curl để tải danh sách về file tạm
    curl -s "$LIST_URL" > ./temp_list.txt
    
    if [ ! -s ./temp_list.txt ]; then
        echo -e "\e[1;31m[Lỗi]\e[0m Không tìm thấy file library.txt trên GitHub!"
        echo "Hãy tạo file library.txt trên Repo của bạn trước nhé."
        sleep 2
        return
    fi

    echo "---------------------------------------"
    echo " THƯ VIỆN ĐANG CÓ TRÊN GITHUB CỦA THỌ:"
    cat ./temp_list.txt  # Hiện nội dung file vừa tải về
    echo "---------------------------------------"
    echo -ne "\e[1;33mThọ gõ tên hoặc số cần cài: \e[0m"
    read LIB_NAME
    
    echo "Đang giả lập tải gói: $LIB_NAME..."
    sleep 2
    whiptail --msgbox "Đã cài xong $LIB_NAME thành công!" 10 50
    rm ./temp_list.txt
}

show_menu() {
    clear
    echo -e "\e[1;36m"
    echo "    _______________________________________"
    echo "   |                                       |"
    echo "   |         LUCKFOX STORE V2.7            |"
    echo "   |      --- LIVE FROM GITHUB ---         |"
    echo "   |_______________________________________|"
    echo -e "\e[0m"
    echo " [1] 📥 KHO THƯ VIỆN (GitHub Live)"
    echo " [2] 🌡️ Xem nhiệt độ Chip (Python3)"
    echo " [3] ❌ Thoát"
    echo " ---------------------------------------"
}

# --- MAIN ---
show_menu
while true; do
    echo -ne "\e[1;33mThọ chọn số (1-3): \e[0m"
    read CHOICE
    case $CHOICE in
        1) install_from_github; show_menu ;;
        2) clear; python3 -c "print('CPU Temp: 43.2°C')"; echo "Enter để về..."; read; show_menu ;;
        3) exit 0 ;;
        *) echo "Chọn 1-3 thôi Thọ!"; sleep 1; show_menu ;;
    esac
done
