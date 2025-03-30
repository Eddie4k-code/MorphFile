from abc import ABC, abstractmethod

class ApiCaller(ABC):
    """
    A blueprint to handle API calls.
    """

    def __init__(self, api_client):
        """
        Initialize the ApiCaller with an API client.

        :param api_client: An instance of an API client to make requests.
        """
        self.api_client = api_client

        
    @abstractmethod
    # Define the method to call APIs, which should be implemented by subclasses.
    def call_apis(self, endpoint, method='GET', params=None, data=None):
       pass