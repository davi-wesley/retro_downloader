def snake_to_pascal_case(s):
         if "_" in s:
            words = s.split('_')
            camel_case = ''.join(word.capitalize() for word in words)
            return camel_case
         else:
              return s[0].capitalize() + s[1:] if s else ""