
from converters.BaseConverter import BaseConverter
import threading

import csv

# This class is responsible for converting text files to CSV files.
class TextToCsvConverter(BaseConverter):

    def convert(self, input_file, output_file):
        """
        Convert a text file to a CSV file.
        Each line in the text file is expected to be a comma-separated
        """
        
        with open(input_file, 'r') as infile, open(output_file, 'w') as outfile:
            stripped = (line.strip() for line in infile)
            # Filter out empty lines
            # and split each line by commas
            lines = (line.split(",") for line in stripped if line)
            writer = csv.writer(outfile)
            writer.writerows(lines)

            return outfile

    def convert_in_thread(self, input_file, output_file):
        """
        Convert a text file to a CSV file in a separate thread.
        """
        thread = threading.Thread(target=self.convert, args=(input_file, output_file))
        thread.start()