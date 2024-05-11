import os

from controller_builder import ControllerBuilder as cb
from dialog_builder import DialogBuilder as db
from form_builder import FormBuilder as fb
from form_page_builder import FormPageBuilder as fpb

flow_name = input('Flow name:')
flow_dialog_type = input('is it a dialog? (yes/no)')
path = f'D:\DW\retroDownloader\python\\flowfy\{flow_name}'

#CRIA A PASTA
os.makedirs(path, exist_ok=True)

#CRIA OS ARQUIVOS DENTRO DA PASTA, CONTROLLER, FORM E DIALOG/PAGE

if flow_dialog_type == 'yes':
    file_controller_path = os.path.join(path, f'{flow_name}_dialog_controller.dart')
else:
    file_controller_path = os.path.join(path, f'{flow_name}_controller.dart')

if flow_dialog_type == 'yes':
    file_form_path = os.path.join(path, f'{flow_name}_dialog_form.dart')
else:
    file_form_path = os.path.join(path, f'{flow_name}_form.dart')

if flow_dialog_type == 'yes':
    file_page_path = os.path.join(path, f'{flow_name}_dialog.dart')
else:
    file_page_path = os.path.join(path, f'{flow_name}_form_page.dart')

with open(file_controller_path, 'w') as fcp:
    fcp.write(cb.create_controller(flow_name, flow_dialog_type))

with open(file_form_path, 'w') as ffp:
    ffp.write(fb.create_form(flow_name, flow_dialog_type))

with open(file_page_path, 'w') as fpp:
    if flow_dialog_type == 'yes':
        fpp.write(db.create_dialog(flow_name))
    else:
        fpp.write(fpb.create_form_page(flow_name))