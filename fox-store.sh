#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import os, sys, time, requests


USER = "Thooooooo"
REPO = "luckfox-store"
RAW_BASE = f"https://raw.githubusercontent.com/{USER}/{REPO}/main"
API_URL = f"https://api.github.com/repos/{USER}/{REPO}/contents/bin"

# Màu sắc
GREEN = "\033[92m"
RED = "\033[91m"
BLUE = "\033[94m"
YELLOW = "\033[93m"
END = "\033[0m"

def get_remote_libs():
    """Lấy danh sách file từ GitHub API"""
    try:
        response = requests.get(API_URL, timeout=5)
        if response.status_code == 200:
            files = [item['name'] for item in response.json() if item['name'].endswith('.so')]
            return files
        return []
    except:
        return []

def main():
    ver = f"{sys.version_info.major}.{sys.version_info.minor}"
    ver_tag = ver.replace('.', '')
    
    while True:
        os.system('clear')
        print(f"{BLUE}=== 🦊 LUCKFOX STORE CLIENT ==={END}")
        print(f"Bản Python của Thọ: {GREEN}{ver}{END}")
        print("-" * 35)
        print(f" [{GREEN}1{END}] 📥 Cài Thư Viện (Nhập tên)")
        print(f" [{GREEN}2{END}] 🌡️ Kiểm tra hệ thống")
        print(f" [{GREEN}3{END}] ❌ Thoát")
        print(f" [{YELLOW}4{END}] 📜 Xem danh sách 'hàng' trên kệ")
        
        choice = input(f"\n{BLUE}Thọ chọn số:{END} ")
        
        if choice == '1':
            target = input(f"Nhập tên thư viện (vd: {GREEN}ujson{END}): ").strip().lower()
            if not target: continue
            
            fname = f"{target}.py{ver_tag}.so"
            url = f"{RAW_BASE}/bin/{fname}"
            
            print(f"\n📡 Đang tìm {GREEN}{fname}{END}...")
            if os.system(f"wget -q --spider {url}") == 0:
                os.system(f"wget -q {url} -O {target}.so")
                print(f"{GREEN}✅ Đã nạp {target} thành công!{END}")
            else:
                print(f"{RED}❌ Lỗi: Bản {ver} cho '{target}' chưa có.{END}")
            time.sleep(2)

        elif choice == '2':
            os.system('top -n 1 | head -n 10')
            # Thêm lệnh xem nhiệt độ cho Luckfox nếu có
            if os.path.exists("/sys/class/thermal/thermal_zone0/temp"):
                with open("/sys/class/thermal/thermal_zone0/temp") as f:
                    temp = int(f.read()) / 1000
                print(f"\n🔥 Nhiệt độ Luckfox: {YELLOW}{temp}°C{END}")
            input("\nNhấn Enter để quay lại...")

        elif choice == '4':
            print(f"\n{YELLOW}📡 Đang kiểm tra kho hàng...{END}")
            libs = get_remote_libs()
            if libs:
                print(f"\n{BLUE}Các file .so đang có sẵn:{END}")
                # Gom nhóm theo tên thư viện cho dễ nhìn
                current_libs = set([l.split('.')[0] for l in libs])
                for lib in sorted(current_libs):
                    versions = [l.split('.')[1].replace('py','') for l in libs if l.startswith(lib+".")]
                    print(f" 📦 {GREEN}{lib:<12}{END} (Bản: {', '.join(versions)})")
            else:
                print(f"{RED}⚠️ Không kết nối được với kho hàng.{END}")
            input("\nNhấn Enter để quay lại...")

        elif choice == '3':
            break

if __name__ == "__main__":
    main()
