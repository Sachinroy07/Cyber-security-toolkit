import tkinter as tk
from tkinter import messagebox
import subprocess

def run_command(command):
    try:
        output = subprocess.getoutput(command)
        messagebox.showinfo("Output", output)
    except Exception as e:
        messagebox.showerror("Error", str(e))

def scan_ports():
    target = target_entry.get()
    if target:
        run_command(f"nmap -F {target}")
    else:
        messagebox.showwarning("Input Required", "Enter a target domain or IP.")

def subdomain_enum():
    target = target_entry.get()
    if target:
        run_command(f"subfinder -d {target}")
    else:
        messagebox.showwarning("Input Required", "Enter a target domain.")

def vuln_scan():
    target = target_entry.get()
    if target:
        run_command(f"nuclei -u http://{target}")
    else:
        messagebox.showwarning("Input Required", "Enter a target domain.")

root = tk.Tk()
root.title("Unified Ethical Hacking Toolkit")

tk.Label(root, text="Target (IP or Domain):").pack(pady=5)
target_entry = tk.Entry(root, width=40)
target_entry.pack(pady=5)

tk.Button(root, text="Run Port Scan (Nmap)", command=scan_ports).pack(pady=5)
tk.Button(root, text="Subdomain Enumeration (Subfinder)", command=subdomain_enum).pack(pady=5)
tk.Button(root, text="Basic Vulnerability Scan (Nuclei)", command=vuln_scan).pack(pady=5)

root.mainloop()
