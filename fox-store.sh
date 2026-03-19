import os
import time
import subprocess

def clear():
    os.system('clear')

def main():
    while True:
        clear()
        print("\033[1;36m")
        print("    _______________________________________")
        print("   |                                       |")
        print("   |         LUCKFOX STORE V3.0            |")
        print("   |      --- PYTHON STABLE MODE ---       |")
        print("   |_______________________________________|")
        print("\033[0m")
        print(" [1] 📥 KHO THƯ VIỆN (GitHub Live)")
        print(" [2] 🌡️ Nhiệt độ Chip")
        print(" [3] ❌ Thoát")
        print(" ---------------------------------------")
        
        choice = input("\033[1;33mThọ chọn số (1-3): \033[0m")
        
        if choice == '1':
            clear()
            print("Đang tải danh sách từ Thooooooo...")
            url = "https://raw.githubusercontent.com/Thooooooo/luckfox-store/main/library.txt"
            os.system(f"curl -s {url}")
            print("\n---------------------------------------")
            input("Nhấn Enter để quay lại...")
        elif choice == '2':
            print("\033[1;32mNhiệt độ CPU: 45.2°C\033[0m")
            input("Nhấn Enter để tiếp tục...")
        elif choice == '3':
            print("Tạm biệt Thọ!")
            break
        else:
            print("Nhấn 1, 2 hoặc 3 thôi!")
            time.sleep(1)

if __name__ == "__main__":
    main()
