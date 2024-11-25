import tkinter as tk
import webview
import os
import ctypes
import time

class ChatWidgetApp:
    def __init__(self):
        self.root = tk.Tk()
        self.root.withdraw() 

        self.create_webview()

    def create_webview(self):
        html_file = os.path.join(r'C:\Win_Apps\HTML', 'chat_widget.html')
        webview_window = webview.create_window('Chat Widget', f'file:///{html_file}', width=400, height=600, resizable=True)
        webview.start(self.minimize, webview_window)

    def minimize(self, window):
        time.sleep(1)
        window_id = ctypes.windll.user32.FindWindowW(None, "Chat Widget")
        if window_id:
            ctypes.windll.user32.ShowWindow(window_id, 6)  

if __name__ == "__main__":
    app = ChatWidgetApp()
