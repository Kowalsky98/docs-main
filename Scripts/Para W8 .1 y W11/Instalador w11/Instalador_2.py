import tkinter as tk
from tkinter import messagebox
import subprocess

class InstallerApp(tk.Tk):
    def __init__(self):
        super().__init__()
        self.title("PikaInstalador")
        self.geometry("500x550")

        self.background_image = tk.PhotoImage(file="C:\\Instalador w11\\Fondo.png")

        self.background_label = tk.Label(self, image=self.background_image)
        self.background_label.place(relwidth=1, relheight=1)

        self.commands = [
            ("AccesosDirectosW", '"C:\\Win_Apps\\AccesosDirectos.bat"'),
            ("PlanEnergia", '"C:\\Win_Apps\\PlanEnergia.bat"'),
            ("Taquilla", '"C:\\Win_Apps\\Taquilla.bat"'),
            ("Fondo", '"C:\\Win_Apps\\Fondo.bat"'),
            ("Serial", '"C:\\Win_Apps\\Serial.bat"'),
            ("Post_Instalacion_W11", '"C:\\Win_Apps\\Post_Instalacion_W11.bat"'),
            ("winrar", '"C:\\Win_Apps\\winrar.exe"'),
            ("rustdesk", '"C:\\Win_Apps\\rustdesk.exe"'),
            ("XPrinter", '"C:\\Win_Apps\\XPrinter.exe"'),
            ("Videos", '"C:\\Win_Apps\\Videos.bat"'),
            ("aida64", self.silent_install_command('"C:\\Win_Apps\\aida64.exe"', '/SILENT')),
            ("Crystaldisk", self.silent_install_command('"C:\\Win_Apps\\CrystalDisk.exe"', '/SILENT')),
            ("ServidorKMS", '"C:\\Win_Apps\\W10_11_PRO.bat"'),
            ("Chrome", '"C:\\Win_Apps\\Chrome.exe"'),
            ("Booster", self.silent_install_command('"C:\\Win_Apps\\Booster.exe"', '/SILENT')),
            ("AnyDesk", '"C:\\Win_Apps\\AnyDesk.exe"')
        ]

        self.current_command = 0

        self.create_widgets()

    def create_widgets(self):
        self.instructions = tk.Label(self, text="Presiona 'GO' para comenzar ", bg='#000000', fg='#ffffff', font=('Arial', 12, 'bold'))
        self.instructions.place(x=150, y=20)

        self.start_button = tk.Button(self, text="GO", command=self.run_next_command, bg='#003A70', fg='#ffffff', font=('Arial', 10, 'bold'), activebackground='#FFCC00', activeforeground='#003A70')
        self.start_button.place(x=250, y=70)

        self.status_label = tk.Label(self, text="", bg='#000000', fg='#ffffff', font=('Arial', 10, 'bold'))
        self.status_label.place(x=150, y=120)

        self.progress = tk.Listbox(self, width=50, height=10, bg='#ffffff', fg='#000000', font=('Arial', 10, 'bold'))
        self.progress.place(x=80, y=160)

    def silent_install_command(self, command, silent_flag):
        return f'{command} {silent_flag}'

    def run_next_command(self):
        if self.current_command < len(self.commands):
            name, command = self.commands[self.current_command]
            self.status_label.config(text=f"Ejecutando: {name}")
            self.progress.insert(tk.END, f"Ejecutando: {name}")
            self.progress.yview(tk.END)

            try:
                result = subprocess.run(command, shell=True, check=True)
                if result.returncode == 0:
                    self.progress.insert(tk.END, f"Completado: {name}")
                else:
                    self.progress.insert(tk.END, f"Error ejecutando {name}: Código de retorno {result.returncode}")
                self.progress.yview(tk.END)
            except subprocess.CalledProcessError as e:
                self.progress.insert(tk.END, f"Error ejecutando {name}: {str(e)}")
                self.progress.yview(tk.END)
                messagebox.showerror("Error", f"Error ejecutando {name}: {str(e)}")
                return

            self.current_command += 1
            self.after(3000, self.run_next_command)  # Espera 3 segundos antes de ejecutar el siguiente comando
        else:
            self.status_label.config(text="Todos los archivos han terminado de ejecutarse.")
            messagebox.showinfo("Completado", "Todos los archivos han terminado de ejecutarse.")
            self.start_button.config(state=tk.NORMAL)

if __name__ == "__main__":
    app = InstallerApp()
    app.mainloop()
