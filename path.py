import os
import tkinter as tk
from tkinter import filedialog, messagebox
from pathlib import Path

# Hàm xuất đường dẫn các tệp vào filelist.txt
def exportpath():
    # Lấy đường dẫn thư mục từ textbox và chuyển thành kiểu Path
    path_folder = Path(txt_folder_path.get()) 
    # Lấy danh sách tất cả các tệp trong thư mục (bao gồm cả thư mục con)
    file_list = get_all_files(path_folder) 
    # Ghi danh sách tệp vào filelist.txt
    writetext(file_list) 
    # Kích hoạt nút "Replace and Open" sau khi xuất
    btn_replace_path.config(state="normal")  

# Hàm mở hộp thoại chọn thư mục và hiển thị đường dẫn vào textbox
def loadfolder():
    # Mở hộp thoại chọn thư mục
    browse_folder = filedialog.askdirectory()  
    # Kích hoạt textbox
    txt_folder_path.config(state="normal")  
    # Xóa nội dung hiện tại của textbox
    txt_folder_path.delete(0, tk.END)  
    # Chèn đường dẫn thư mục vừa chọn vào textbox
    txt_folder_path.insert(0, browse_folder) 

# Hàm lấy danh sách tất cả các tệp trong thư mục và thư mục con
def get_all_files(folder):
    file_list = []  
    # Kiểm tra thư mục có tồn tại hay không
    if folder.exists():
        # Duyệt qua tất cả các tệp trong thư mục và thư mục con
        for root, dirs, files in os.walk(folder):
            for file in files:
                # Thêm đường dẫn đầy đủ của tệp vào danh sách
                file_list.append(Path(root) / file)  
    return file_list

# Hàm ghi danh sách tệp vào filelist.txt với mã hóa UTF-8
def writetext(listpathget):
    try:
        # Mở filelist.txt ở chế độ ghi, sử dụng mã hóa UTF-8
        with open(Path(os.getcwd()) / 'filelist.txt', 'w', encoding='utf-8') as writefile: 
            for item in listpathget:
                # Ghi từng đường dẫn tệp vào filelist.txt, chuyển đổi Path thành chuỗi (str)
                writefile.write(str(item) + '\n') 
    # Bắt lỗi UnicodeEncodeError nếu có ký tự không thể mã hóa UTF-8
    except UnicodeEncodeError:  
        messagebox.showerror("Lỗi", "Không thể ghi file filelist.txt. Vui lòng kiểm tra lại ký tự đặc biệt trong đường dẫn.")

# Hàm thay thế đường dẫn gốc bằng đường dẫn tương đối và mở filelist.txt
def replacepath():
    # Lấy đường dẫn gốc từ textbox và chuyển thành kiểu Path
    root_path = Path(txt_folder_path.get())  
    # Lấy tên thư mục cuối cùng của đường dẫn gốc
    last_folder = root_path.name  
    try:
        # Mở filelist.txt ở chế độ đọc, sử dụng mã hóa UTF-8
        with open(Path(os.getcwd()) / 'filelist.txt', 'r', encoding='utf-8') as rfile:  
            filedata = rfile.read()

        # Thay thế đường dẫn gốc bằng đường dẫn tương đối (tên thư mục cuối)
        filedata = filedata.replace(str(root_path), '\\' + last_folder)
        # Mở filelist.txt ở chế độ ghi, sử dụng mã hóa UTF-8
        with open(Path(os.getcwd()) / 'filelist.txt', 'w', encoding='utf-8') as wfile:  
            wfile.write(filedata)

        # Mở filelist.txt bằng trình xem mặc định của hệ thống
        os.startfile(Path(os.getcwd()) / 'filelist.txt')
    # Bắt lỗi UnicodeDecodeError hoặc UnicodeEncodeError nếu có vấn đề về mã hóa
    except (UnicodeDecodeError, UnicodeEncodeError): 
        messagebox.showerror("Lỗi", "Lỗi đọc hoặc ghi file filelist.txt. Vui lòng kiểm tra lại mã hóa và ký tự đặc biệt.")

# Tạo cửa sổ giao diện chính
mainprogram = tk.Tk() 
# Đặt tiêu đề cho cửa sổ
mainprogram.title('Get files path - @Copyright by Jackie Gaming')
# Đặt kích thước cửa sổ
mainprogram.geometry('324x70') 
# Đặt icon cho cửa sổ 
mainprogram.iconbitmap(Path(os.getcwd()) / "vltk.ico")

# Tạo và vị trí các nút và textbox trên giao diện
btn_folder_path = tk.Button(mainprogram, text="Chọn đường dẫn Folder", width=25, command=loadfolder)
btn_folder_path.place(x=7, y=7)

txt_folder_path = tk.Entry(mainprogram, text="", width=30, state="disabled")
txt_folder_path.place(x=7, y=36, height=27)

btn_export_txt = tk.Button(mainprogram, text="Export TXT", width=15, command=exportpath)
btn_export_txt.place(x=200, y=7)

btn_replace_path = tk.Button(mainprogram, text="Replace and Open", width=15, command=replacepath, state="disabled")
btn_replace_path.place(x=200, y=36)

# Cấu hình cửa sổ: không cho phép thay đổi kích thước
mainprogram.minsize(width=324, height=70) 
mainprogram.maxsize(width=324, height=70) 
# Bắt đầu vòng lặp chính của giao diện
mainprogram.mainloop() 
