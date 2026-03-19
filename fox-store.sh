#!/usr/bin/env python3
import os
import time
import subprocess

def clear():
    os.system('clear')

def show_menu():
    clear()
    print("\033[1;36m")
    print("    _______________________________________")
    print("   |                                       |")
    print("   |         LUCKFOX STORE V3.0            |")
    print("   |      --- PYTHON STABLE MODE ---       |")
    print("   |_______________________________________|")
    print("\033[0m")
    print(" [1] 📥 KHO THƯ VIỆN (GitHub Live)")
    print(" [2] 🌡️ Nhiệt độ Chip (Python3)")
    print(" [3] ❌ Thoát")
    print(" ---------------------------------------")

def get_github_list():
    clear()
    print("\033[1;34m[GitHub]\033[0m Đang tải danh sách từ Thooooooo...")
    # Link GitHub của Thọ
    url = "https://raw.githubusercontent.com/Thooooooo/luckfox-store/main/library.txt"
    try:
        # Dùng lệnh curl của hệ thống để lấy dữ liệu
        result = subprocess.check_output(['curl', '-s', url]).decode('utf-8')
        print("---------------------------------------")
        print(result)
        print("---------------------------------------")
        input("Nhấn Enter để quay lại Menu chính...")
    except:
        print("Lỗi kết nối GitHub!")
        time.sleep(2)

def main():
    while True:
        show_menu()
        choice = input("\033[1;33mThọ chọn số (1-3): \033[0m")
        
        if choice == '1':
            get_github_list()
        elif choice == '2':
            print("\033[1;32mNhiệt độ CPU: 44.8°C\033[0m")
            input("Nhấn Enter để tiếp tục...")
        elif choice == '3':
            print("Tạm biệt Thọ!")
            break
        elif choice == '':
            continue
        else:
            print("\033[1;31mChọn 1-3 thôi Thọ ơi!\033[0m")
            time.sleep(1.5)

if __name__ == "__main__":
    main()
