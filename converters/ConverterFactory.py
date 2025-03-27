from converters import *
from converters.TextToCsv import TextToCsvConverter

class ConverterFactory:
    """
    A factory class for creating converter instances based on the provided type.
    """

    @staticmethod
    def create_converter(converter_type):
        """
        Creates a converter instance based on the specified type.

        :param converter_type: The type of converter to create (e.g., 'txt_to_csv').
        :return: An instance of the specified converter.
        """
        if converter_type == 'txt_to_csv':
            return TextToCsvConverter()
        else:
            raise ValueError(f"Unsupported converter type: {converter_type}")