import json
import re
import sys

import yaml

existing_classes = [] 

def generate_dart_class(class_name, data):
    global existing_classes  # Access the global list of existing classes
    
    if class_name in existing_classes:
        return ''  # Skip generating the class if it already exists
    
    existing_classes.append(class_name)  # Add the class name to the existing classes list

    dart_classes = []
    dart_class = f'class {class_name} ' + '{\n'

    # Generate class fields
    for key, value in data.items():
        dart_class += f' {get_dart_type(key, value)} {snake_to_camel_case(key)} = {get_default_value(key, value)};\n'  # Add "?" symbol to make the variables optional

    # Generate constructor
    constructor_params = ', '.join([f'this.{key}' for key in data.keys()])
    dart_class += f'\n  {class_name}();\n'  # Add braces around parameters

    # Generate fromJson named constructor
    dart_class += f'\n  {class_name}.fromJson(Map<String, dynamic> json)'
    dart_class += '{\n'
    for key, value in data.items():
        if isinstance(value, dict):
            ##nested_class_name = key[0].upper() + key[1:]
            nested_class_name = snake_to_pascal_case(key)   
            dart_class += f'    {snake_to_camel_case(key)} = json["{key}"] != null ? {nested_class_name}.fromJson(json["{key}"]) : {nested_class_name}();\n'
            nested_class = generate_dart_class(nested_class_name, value)
            dart_classes.append(nested_class)
        elif isinstance(value, list):
            list_value = value[0]
            if isinstance(list_value, dict):
                ##nested_class_name = key[0].upper() + key[1:]
                nested_class_name = snake_to_pascal_case(key)
                ##nested_class_list_name = f'{key}List'
                dart_class += f'    {snake_to_camel_case(key)} = json["{key}"] != null ? List<{nested_class_name}>.from(json["{key}"].map((x) => {nested_class_name}.fromJson(x))) : [];\n'
                nested_class = generate_dart_class(nested_class_name, list_value)
                dart_classes.append(nested_class)
        else:
            if isinstance(value, str):
                dart_class += f'    {snake_to_camel_case(key)} = json["{key}"] ?? "";\n'  # Treat null value for String variables
            elif isinstance(value, bool):
                dart_class += f'    {snake_to_camel_case(key)} = json["{key}"] ?? false;\n'  # Treat null value for boolean variables
            elif isinstance(value, float):
                dart_class += f'    {snake_to_camel_case(key)} = json["{key}"] ?? 0;\n'  # Treat null value for double variables
            elif isinstance(value, int):
                dart_class += f'    {snake_to_camel_case(key)} = json["{key}"] ?? 0;\n'  # Treat null value for int variables
            else:
                dart_class += f'    {snake_to_camel_case(key)} = json["{key}"];\n'
    dart_class += '  }\n'

    # Generate toJson method
    dart_class += f'\n  Map<String, dynamic> toJson() => '
    dart_class += '{' + ', '.join([f'"{key}": {to_json_value(key, value)}' for key, value in data.items()]) + '};\n'

    dart_class += '}\n'
    dart_classes.append(dart_class)

    return '\n\n'.join(reversed(dart_classes)) 

def from_json_value(key, value):
    if isinstance(value, dict):
        ###nested_class_name = key[0].upper() + key[1:]
        nested_class_name = snake_to_pascal_case(key)
        return f'{nested_class_name}.fromJson(json["{key}"])'
    elif isinstance(value, list):
        if len(value) > 0 and isinstance(value[0], dict):
            nested_class_name = key[0].upper() + key[1:]
            return f'List<{nested_class_name}>.from(json["{key}"].map((item) => {nested_class_name}.fromJson(item)))'
    return f'json["{key}"]'

def get_dart_type(key, value):
    if isinstance(value, bool):
        return 'bool'
    elif isinstance(value, float):
        return 'double'
    elif isinstance(value, int):
        if 'id' in key.lower(): return 'int'
        if 'total' in key.lower(): return 'double'
        if 'valor' in key.lower(): return 'double'
        return 'int'
    elif isinstance(value, dict):
        ##return key[0].upper() + key[1:]  # Use the key name as the model name
        return snake_to_pascal_case(key)
    elif isinstance(value, list):
        if len(value) > 0:
            return 'List<{}>'.format(get_dart_type(key, value[0]))
        else:
            return 'List<dynamic>'
    else:
        return 'String'
    
def get_default_value(key, value):
    if isinstance(value, bool):
        return 'false'
    elif isinstance(value, int):
        return '0'
    elif isinstance(value, str):
        return '\'\''
    elif isinstance(value, float):
        return '0.0'
    elif isinstance(value, list):
        return '<' + snake_to_pascal_case(key) +'>[]'
    else:
        return f'{snake_to_pascal_case(key)}()'
    
def snake_to_pascal_case(s):
    if "_" in s:
        words = s.split('_')
        camel_case = ''.join(word.capitalize() for word in words)
        return camel_case
    else:
        return s[0].capitalize() + s[1:] if s else ""

def snake_to_camel_case(s):
        words = s.split('_')
        camel_case = words[0] + ''.join(word.capitalize() for word in words[1:])
        return camel_case
    

def to_json_value(key, value):
    if isinstance(value, dict):
        return f'{snake_to_camel_case(key)}.toJson()'
    elif isinstance(value, list):
        if len(value) > 0 and isinstance(value[0], dict):
            return f'{snake_to_camel_case(key)}!.map((item) => item.toJson()).toList()'
    return snake_to_camel_case(key)

def pascal_to_snake_case(string):
    # Insert an underscore before any uppercase letter
    snake_case = re.sub(r'(?<!^)(?=[A-Z])', '_', string)
    # Convert the string to lowercase
    snake_case = snake_case.lower()
    return snake_case

# Ler o arquivo YAML "values.yaml"
with open('decode_config.yaml', 'r') as config:
    config_content = config.read()

# Fazer o parsing do conteúdo YAML
config_data = yaml.safe_load(config_content)

# Extrair o nome da classe e os dados JSON
class_name = config_data['class_name']
json_data = config_data['json_data']

# Load the JSON data
try:
    data = json.loads(json_data)
except json.JSONDecodeError as e:
    print("Invalid JSON data:", e)
    sys.exit(1)

# Generate the Dart class
dart_classes = generate_dart_class(class_name, data)

# Write the Dart class to a file
file_name = pascal_to_snake_case(class_name) + "_model.dart"
with open(file_name, "w") as f:
    f.write(dart_classes)

