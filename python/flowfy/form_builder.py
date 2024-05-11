from build_utils import snake_to_pascal_case


class FormBuilder():
    def create_form(flow_name : str, flow_dialog_type: str):
     name = snake_to_pascal_case(flow_name) + ('Dialog' if flow_dialog_type else '')
     value = f'''
class {name}Form {{}}
'''
     return value

