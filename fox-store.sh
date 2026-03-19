import os
import sys
import time
import subprocess

# --- CẤU HÌNH ---
USER = "Thooooooo"
REPO = "luckfox-store"
RAW_BASE = f"https://raw.githubusercontent/{USER}/{REPO}/main"

def clear():
    os.system('clear')

def get_py_ver():
    # Lấy phiên bản Python hiện tại (vd: 3.11)
    return f"{sys.version_info.major}.{sys.version_info.minor}"

def main():
    py_ver = get_py_ver()
    while True:
        clear()
        print(f"\033[1;36m")
        print("    ╔═══════════════════════════════════════╗")
        print("    ║           LUCKFOX STORE V4.0          ║")
        print(f"    ║       System Python: {py_ver}             ║")
        print("    ╚═══════════════════════════════════════╝\033[0m")
        
        print(" [1] 📥 KHO THƯ VIỆN (Auto-Detect Python)")
        print(" [2] 🧹 Dọn dẹp hệ thống (Clean Junk)")
        print(" [3] 🌡️ Kiểm tra phần cứng")
        print(" [4] ❌ Thoát")
        print(" ---------------------------------------")
        
        choice = input("\033[1;33mThọ chọn số (1-4): \033[0m")
        
        if choice == '1':
            clear()
            print(f"🔍 Đang quét kho cho Python {py_ver}...")
            # Lấy danh sách từ library.txt
            try:
                cmd = f"curl -s {RAW_BASE}/library.txt"
                libs = subprocess.check_output(cmd, shell=True).decode().splitlines()
                
                for i, lib in enumerate(libs, 1):
                    print(f" [{i}] {lib}")
                print(" [0] Quay lại")
                
                sub = input("\n\033[1;33mChọn số để nạp: \033[0m")
                if sub == '0' or not sub.isdigit(): continue
                
                target = libs[int(sub)-1].split()[1] # Lấy tên thư viện (ujson, opencv...)
                
                # CƠ CHẾ TỰ ĐỘNG CẬP NHẬT TÊN FILE THEO PYTHON VERSION
                filename = f"{target}.py{py_ver.replace('.','')}.so" 
                # Ví dụ: ujson.py311.so
                
                print(f"🚀 Đang tải bản chuẩn cho Luckfox: {filename}...")
                url = f"{RAW_BASE}/bin/{filename}"
                
                res = os.system(f"wget -q {url} -O {target}.so")
                
                if res == 0:
                    print(f"✅ Đã nạp thành công {target}!")
                else:
                    print(f"❌ Lỗi: Bản {target} cho Python {py_ver} chưa có trên kho của Thọ.")
                
                input("\nNhấn Enter để tiếp tục...")
            except:
                print("Lỗi kết nối GitHub!")
                time.sleep(2)

        elif choice == '2':
            print("🧹 Đang dọn dẹp file tạm và cache...")
            os.system("rm -rf *.o *.tmp __pycache__")
            time.sleep(1)
            print("✅ Hệ thống sạch sẽ!")
            time.sleep(1)

        elif choice == '4':
            break

if __name__ == "__main__":
    main()
