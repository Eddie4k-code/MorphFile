from converters.TextToCsv import TextToCsvConverter
from converters.HTMLToPdf import HTMLToPdf
import os
from dotenv import load_dotenv

print(os.getcwd())


print(os.getenv('FILE_CONVERTER_API_SECRET'))

test = HTMLToPdf()
result = test.convert('input.html', 'test.pdf')


print(result)
