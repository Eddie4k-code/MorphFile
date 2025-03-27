from converters.BaseConverter import BaseConverter
import requests
from converters.utils.converter_tools_api import ConverterToolsAPI
import os
import base64
import shutil



class HTMLToPdf(BaseConverter):
    def convert(self, input_file, output_file):
        """
        Convert an HTML file to a PDF file.
        """
        
        try:

            wd = os.getcwd() + "/converters/"

            with open(os.getcwd() + "/converters/" + input_file, 'rb') as file:
                
                file_content = file.read()
                print(file_content)

                files = {
                    'file': (input_file, file_content, 'text/html')
                }


                
                response = ConverterToolsAPI(api_client=requests).call_apis(
                    method='POST',
                    files=files
                )

                with open(output_file, 'wb') as pdf_file:
                    pdf_file.write(response)
                
        except:
            raise ValueError(f"Failed to fetch the HTML content from {input_file}")

    




    

        return output_file