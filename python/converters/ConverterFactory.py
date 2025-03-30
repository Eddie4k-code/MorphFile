from converters import *
from converters.TextToCsv import TextToCsvConverter
from converters.HTMLToPdf import HTMLToPdfConverter
from converters.BaseConverter import BaseConverter

class ConverterFactory:
    """
    A factory class for creating converter instances based on the provided type.
    """

    @staticmethod
    def create_converter(converter_type: str) -> BaseConverter:
        """
        Creates a converter instance based on the specified type.

        :param converter_type: The type of converter to create (e.g., 'txt-to-csv').
        :return: An instance of the specified converter.
        """


        if converter_type == 'txt-to-csv':
            return TextToCsvConverter()
        
        elif converter_type == 'html-to-pdf':
            return HTMLToPdfConverter()
        else:
            raise ValueError(f"Unsupported converter type: {converter_type}")