#!/bin/bash

# --- CẤU HÌNH GITHUB CỦA THỌ ---
GITHUB_USER="Thooooooo"
REPO_NAME="luckfox-store"
LIST_URL="https://raw.githubusercontent.com/$GITHUB_USER/$REPO_NAME/main/library.txt"

install_from_github() {
    clear
    echo -e "\e[1;34m[GitHub]\e[0m Đang tải danh sách..."
    curl -s "$LIST_URL" > ./temp_list.txt
    echo "---------------------------------------"
    cat ./temp_list.txt
    echo "---------------------------------------"
    echo -n "Nhập tên gói (hoặc nhấn Enter để về): "
    read LIB_NAME
    [ -n "$LIB_NAME" ] && echo "Đang giả lập cài $LIB_NAME..." && sleep 2
    rm -f ./temp_list.txt
}

# --- MENU CHÍNH ---
while true; do
    clear
    echo -e "\e[1;36m LUCKFOX STORE V2.9 - IPAD STABLE \e[0m"
    echo " ---------------------------------------"
    echo " [1] 📥 KHO THƯ VIỆN (GitHub Live)"
    echo " [2] 🌡️ Nhiệt độ Chip (Python3)"
    echo " [3] ❌ Thoát"
    echo " ---------------------------------------"
    echo -n "Thọ chọn số (1-3): "
    
    # Dùng lệnh read có thời gian chờ để chống trôi
    if read -t 10 CHOICE; then
        case $CHOICE in
            1) install_from_github ;;
            2) 
                echo -n "Nhiệt độ: "
                python3 -c "print('44.1°C')"
                echo "Nhấn Enter để tiếp tục..."
                read 
                ;;
            3) exit 0 ;;
            "") continue ;; # Nếu Enter trống thì bỏ qua
            *) 
                echo -e "\e[1;31mChọn 1-3 thôi Thọ! (Đang chờ 2s...)\e[0m"
                sleep 2 
                ;;
        esac
    else
        # Nếu sau 10s Thọ không bấm gì, nó sẽ vẽ lại menu cho đẹp
        continue
    fi
done
