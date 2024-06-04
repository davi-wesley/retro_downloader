import json
import os
from typing import List

from playwright.sync_api import sync_playwright


class Console():
    path : str
    name : str

    def __init__(self, path, name):
        self.path = path
        self.name = name

def get_consoles() -> List[Console]:

    with sync_playwright() as p:

        #Open the browser with the download context
        browser = p.chromium.launch(headless=True)
        context = browser.new_context(accept_downloads=True)
        page = context.new_page()

        #Entering on first page
        print('Inicializando programa')
        page.goto("https://vimm.net")
        page.query_selector('#mainMenu > a:nth-child(2)').click()

        consoles : List[Console] = []
        page.wait_for_selector("#subMenu", state="visible")
        consoles_selector = page.locator('xpath=//*[@id="subMenu"]/a')
        consoles_count = consoles_selector.count()
        
        print(f"Quantidade de consoles: {consoles_selector.count()}")

        for item in range(consoles_count):
            if item > 0:
                path : str = f'xpath=//*[@id="subMenu"]/a[{item}]'
                console_name : str  = page.locator(path).text_content()
                print(f'NOME CONSOLE: {console_name}')
                consoles.append({'path':path, 'name':console_name})

        consoles_list_path = f'python\\consoles.json'
        
        if os.path.isfile(consoles_list_path):
            os.remove(consoles_list_path)
            print("Arquivo removido com sucesso.")
        else:
            print("O arquivo não existe.")

        with open(consoles_list_path, 'w') as json_file:
            json_string = json.dumps(consoles)
            json_file
            json_file.write(json_string)

        return consoles
    
get_consoles()