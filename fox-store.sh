import os, sys, time

USER = "Thooooooo"
REPO = "luckfox-store"
RAW_BASE = f"https://raw.githubusercontent.com/{USER}/{REPO}/main"

# Màu sắc cho rực rỡ trên màn hình Terminal
GREEN = "\033[92m"
RED = "\033[91m"
BLUE = "\033[94m"
END = "\033[0m"

def main():
    # Tự nhận diện bản Python (vd: 3.12 -> 312)
    ver = f"{sys.version_info.major}.{sys.version_info.minor}"
    ver_tag = ver.replace('.', '')
    
    while True:
        os.system('clear')
        print(f"{BLUE}=== 🦊 LUCKFOX STORE CLIENT ==={END}")
        print(f"Bản Python hiện tại: {GREEN}{ver}{END}")
        print("-" * 30)
        print(f" [{GREEN}1{END}] 📥 Cài Thư Viện (Auto-Detect)")
        print(f" [{GREEN}2{END}] 🌡️ Kiểm tra hệ thống (btop/top)")
        print(f" [{GREEN}3{END}] ❌ Thoát")
        
        choice = input(f"\n{BLUE}Thọ chọn số:{END} ")
        
        if choice == '1':
            target = input(f"Nhập tên thư viện (vd: {GREEN}ujson{END}): ").strip().lower()
            if not target: continue
            
            # Tên file chuẩn trên kệ: ujson.py312.so
            fname = f"{target}.py{ver_tag}.so"
            url = f"{RAW_BASE}/bin/{fname}"
            
            print(f"\n📡 Đang tìm bản {GREEN}{fname}{END} trên kệ GitHub...")
            
            # Dùng wget tải về và đổi tên thành target.so (để import dễ dàng)
            res = os.system(f"wget -q --spider {url}") # Kiểm tra file có tồn tại ko trước
            
            if res == 0:
                os.system(f"wget -q {url} -O {target}.so")
                print(f"{GREEN}✅ Đã nạp {target} thành công!{END}")
                print(f"💡 Cách dùng: {BLUE}import {target}{END}")
            else:
                print(f"{RED}❌ Lỗi: Bản {ver} cho '{target}' chưa có trên kệ.{END}")
                print(f"🔗 Hãy kiểm tra tại: https://github.com/{USER}/{REPO}")
            
            time.sleep(3)
            
        elif choice == '2':
            os.system('top -n 1')
            input("\nNhấn Enter để quay lại...")
            
        elif choice == '3':
            print("Tạm biệt Thọ! 👋")
            break

if __name__ == "__main__":
    main()
