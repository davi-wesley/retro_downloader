import json
import os
import sys
import time
from pathlib import Path
from typing import List

from playwright.sync_api import sync_playwright


class Game():
    path : str
    title : str
    system : str
    region : str
    version : str

    def __init__(self, path, title, system, region, version):
        self.path = path
        self.title = title
        self.system = system
        self.region = region
        self.version = version

def get_games(game_title : str) -> List[Game]:

    with sync_playwright() as p:

        #Open the browser with the download context
        browser = p.chromium.launch(headless=True)
        context = browser.new_context(accept_downloads=True)
        page = context.new_page()

        #Entering on first page
        print('Inicializando programa')
        page.goto("https://vimm.net/", timeout= 0)

        #Entering on the console's page
        page.query_selector('a:nth-child(2)').click()

        # #Search the game
        page.locator('xpath=//*[@id="main"]/div/main/div[2]/form/p/input[2]').click()
        page.locator('xpath=//*[@id="main"]/div/main/div[2]/form/p/input[2]').fill(game_title)
        page.locator('xpath=//*[@id="main"]/div/main/div[2]/form/p/button').click()

        #Getting the game's list
        page.wait_for_selector("#main > div.innerMain > div > main > table", state="visible")
        page.locator('xpath=//*[@id="main"]/div[2]/div/main/table/tbody/tr')
        time.sleep(2)
        print('INCICIANDO FILTRO DE JOGOS')
        games_selector = page.locator('xpath=//*[@id="main"]/div[2]/div/main/table/tbody/tr')
        games_count = games_selector.count()

        print(f'quantidade de jogos encontrados: {games_count}')

        consoles : List[Game] = []
        
        for item in range(games_count):
            if item > 0:
                path : str = f'xpath=//*[@id="main"]/div[2]/div/main/table/tbody/tr[{item}]/td[2]/a'
                title : str  = page.locator(f'xpath=//*[@id="main"]/div[2]/div/main/table/tbody/tr[{item}]/td[2]').text_content()
                system : str = page.locator(f'xpath=//*[@id="main"]/div[2]/div/main/table/tbody/tr[{item}]/td[1]').text_content()
                region : str  = page.locator(f'xpath=//*[@id="main"]/div[2]/div/main/table/tbody/tr[{item}]/td[3]').text_content()
                version : str  = page.locator(f'xpath=//*[@id="main"]/div[2]/div/main/table/tbody/tr[{item}]/td[4]').text_content()
                consoles.append({'path': path, 'title': title, 'system': system, 'region': region, 'version': version})

        games_list_path = f'python\\games.json'

        #Verifing if there is a file already exists
        if os.path.isfile(games_list_path):
            os.remove(games_list_path)
            print("Arquivo removido com sucesso.")
        else:
            print("O arquivo não existe.")

        with open(games_list_path, 'w') as json_file:
            json_string = json.dumps(consoles)
            json_file.write(json_string)

# print(f"Parametro recebido: {sys.argv[1]}")
    
get_games(sys.argv[1])
#Eget_games('Pokemon')

