from converters.BaseConverter import BaseConverter

import weasyprint


class HTMLToPdf(BaseConverter):
    def convert(self, input_file, output_file):
        """
        Convert an HTML file to a PDF file.
        """

        #logic

        return output_file