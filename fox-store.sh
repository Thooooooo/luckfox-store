import os, sys, time, subprocess

USER = "Thooooooo"
REPO = "luckfox-store"
RAW_BASE = f"https://raw.githubusercontent.com/{USER}/{REPO}/main"

def main():
    # Tự nhận diện bản Python hiện tại (vd: 3.13)
    ver = f"{sys.version_info.major}.{sys.version_info.minor}"
    ver_tag = ver.replace('.', '')
    
    while True:
        os.system('clear')
        print(f"\033 📥 Cài Thư Viện (Auto-Detect)")
        print(" [2] 🌡️ Kiểm tra phần cứng")
        print(" [3] ❌ Thoát")
        
        choice = input("\nThọ chọn số: ")
        
        if choice == '1':
            target = input("Nhập tên thư viện (vd: ujson): ")
            fname = f"{target}.py{ver_tag}.so"
            url = f"{RAW_BASE}/bin/{fname}"
            
            print(f"📡 Đang tìm bản {fname}...")
            if os.system(f"wget -q {url} -O {target}.so") == 0:
                print(f"✅ Đã nạp {target} thành công cho Python {ver}!")
            else:
                print(f"❌ Lỗi: Bản {ver} cho {target} chưa có trên kệ GitHub.")
            time.sleep(2)
        elif choice == '3': break

if __name__ == "__main__": main()
