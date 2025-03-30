import requests
from converters.utils.api_caller import ApiCaller
import os
from dotenv import load_dotenv
import base64



# This class is responsible for handling API calls to the converter tools API.
class ConverterToolsAPI(ApiCaller):
    """
    A class to handle API calls for converter tools.
    """

    def __init__(self, api_client):
        """
        Initialize the ConverterToolsAPI with an API client.

        :param api_client: An instance of an API client to make requests.
        """

        load_dotenv()  # Load environment variables from .env file

        super().__init__(api_client)
        self.API_KEY = os.getenv('FILE_CONVERTER_API_SECRET')  # Use environment variable or provided API key    
        self.headers = {
	        "x-rapidapi-key": self.API_KEY,
	        "x-rapidapi-host": "online-multi-format-file-converter-tools-api.p.rapidapi.com",
        }

        self.url = "https://online-multi-format-file-converter-tools-api.p.rapidapi.com/converters/"

    def call_apis(self, method='GET', params=None, data=None, files=None, conversion=None):
        """
        Call the specified API endpoint with the given method and parameters.

        :param endpoint: The API endpoint to call.
        :param method: The HTTP method to use (default is 'GET').
        :param params: Query parameters for the request (default is None).
        :param data: Data to send with the request (default is None).
        :return: The response from the API call.
        """
        response = self.api_client.request(method, self.url + conversion, params=params, data=data, headers=self.headers, files=files)
        response.raise_for_status()  # Raise an error for bad responses

        print(response.headers["Content-Type"])

        print(response.content)  # Debug: print the response text
        return response.content