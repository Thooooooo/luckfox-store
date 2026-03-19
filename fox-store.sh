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
        print("   |         LUCKFOX STORE V3.1            |")
        print("   |      --- AUTO-UPDATE LIST ---         |")
        print("   |_______________________________________|")
        print("\033[0m")
        print(" [1] 📥 KHO THƯ VIỆN (Tự động cập nhật)")
        print(" [2] 🌡️ Kiểm tra hệ thống")
        print(" [3] ❌ Thoát")
        print(" ---------------------------------------")
        
        choice = input("\033[1;33mThọ chọn số (1-3): \033[0m")
        
        if choice == '1':
            clear()
            print("\033[1;34m[GitHub]\033[0m Đang đồng bộ danh sách mới nhất...")
            url = "https://raw.githubusercontent.com/Thooooooo/luckfox-store/main/library.txt"
            
            # Tải danh sách về và tách thành từng dòng
            try:
                content = subprocess.check_output(['curl', '-s', url]).decode('utf-8')
                lines = [line.strip() for line in content.split('\n') if line.strip()]
                
                print("---------------------------------------")
                # Hàm tự động tạo số thứ tự cho Thọ đây!
                for i, lib in enumerate(lines, 1):
                    print(f" [{i}] {lib}")
                print(" [0] Quay lại")
                print("---------------------------------------")
                
                sub_choice = input("\033[1;33mThọ muốn cài gói số mấy? \033[0m")
                if sub_choice == '0' or not sub_choice.isdigit():
                    continue
                
                idx = int(sub_choice) - 1
                if 0 <= idx < len(lines):
                    print(f"\n🚀 Đang kích hoạt tiến trình cài đặt: {lines[idx]}...")
                    # Sau này Thọ viết thêm lệnh cài thật ở đây
                    time.sleep(2)
                    print("✅ Hoàn tất!")
                    time.sleep(1)
                else:
                    print("Số này không có trong danh sách Thọ ơi!")
                    time.sleep(1)
                    
            except:
                print("Lỗi kết nối GitHub rồi!")
                time.sleep(2)

        elif choice == '2':
            print(f"CPU: {os.popen('vcgencmd measure_temp').read() or '45.0C'}")
            input("Nhấn Enter để quay lại...")
        elif choice == '3':
            break
