from abc import ABC, abstractmethod

"""
BaseConverter is an abstract base class for all converters.
"""

class BaseConverter(ABC):
    @abstractmethod
    def convert(self, input_file: str, output_file: str):
        """
        Convert the input file to the output file format.
        
        :param input_file: Path to the input file.
        :param output_file: Path to the output file.
        """
        raise NotImplementedError("Subclasses must implement this method.")
    