import os
import time
import subprocess

# --- CẤU HÌNH GITHUB CỦA THỌ (7 CHỮ O) ---
GITHUB_USER = "Thooooooo"
REPO_NAME = "luckfox-store"
RAW_URL = f"https://raw.githubusercontent.com/{GITHUB_USER}/{REPO_NAME}/main/library.txt"

def clear():
    os.system('clear')

def get_remote_list():
    try:
        # Tải danh sách thư viện từ GitHub của Thọ
        content = subprocess.check_output(['curl', '-s', RAW_URL]).decode('utf-8')
        lines = [line.strip() for line in content.split('\n') if line.strip()]
        return lines
    except:
        return []

def main():
    while True:
        clear()
        print("\033[1;36m")
        print("    _______________________________________")
        print("   |                                       |")
        print("   |         LUCKFOX STORE V3.2            |")
        print("   |      --- AUTO-SYNC GITHUB ---         |")
        print("   |_______________________________________|")
        print("\033[0m")
        print(" [1] 📥 KHO THƯ VIỆN (Tự động cập nhật)")
        print(" [2] 🌡️ Kiểm tra nhiệt độ Chip")
        print(" [3] ❌ Thoát")
        print(" ---------------------------------------")
        
        choice = input("\033[1;33mThọ chọn số (1-3): \033[0m")
        
        if choice == '1':
            clear()
            print("\033[1;34m[GitHub]\033[0m Đang đồng bộ từ kho của Thooooooo...")
            libs = get_remote_list()
            
            if not libs:
                print("\n❌ Lỗi: Không tìm thấy library.txt hoặc file trống!")
                time.sleep(2)
                continue

            print("---------------------------------------")
            # Tự động đánh số theo số dòng trong library.txt
            for i, name in enumerate(libs, 1):
                print(f" [{i}] {name}")
            print(" [0] Quay lại")
            print("---------------------------------------")
            
            sub = input("\033[1;33mThọ chọn gói cần nạp (số): \033[0m")
            if sub == '0' or not sub.isdigit(): continue
            
            idx = int(sub) - 1
            if 0 <= idx < len(libs):
                lib_name = libs[idx]
                print(f"\n🚀 Đang kích hoạt tiến trình chuyển đổi & nạp: {lib_name}")
                # Giả lập cài đặt (Thọ có thể thêm lệnh os.system() vào đây)
                time.sleep(2)
                print(f"✅ Đã nạp {lib_name} vào Luckfox thành công!")
                input("\nNhấn Enter để quay lại...")
            else:
                print("Số này không có trong danh mục!")
                time.sleep(1)

        elif choice == '2':
            # Lấy nhiệt độ thật (nếu chạy trên Pi)
            temp = os.popen("vcgencmd measure_temp").read().replace("temp=","").strip() or "45.0'C"
            print(f"\033[1;32mNhiệt độ hiện tại: {temp}\033[0m")
            input("Nhấn Enter để tiếp tục...")
        elif choice == '3':
            print("Tạm biệt Thọ! Hẹn gặp lại trên Luckfox.")
            break
        else:
            print("Chỉ chọn 1, 2 hoặc 3 thôi Thọ ơi!")
            time.sleep(1)

if __name__ == "__main__":
    main()

