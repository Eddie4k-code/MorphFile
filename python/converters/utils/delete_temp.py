class FileManager:
    def __init__(self, file_path):
        self.file_path = file_path

    def delete_temp_file(self):
        try:
            os.remove(self.file_path)
            print(f"Temporary file {self.file_path} deleted successfully.")
        except FileNotFoundError:
            print(f"Temporary file {self.file_path} not found.")
        except Exception as e:
            print(f"An error occurred while deleting the temporary file: {e}")

    def create_temp_directory(self):
        try:
            os.makedirs(os.path.dirname(self.file_path), exist_ok=True)
            print(f"Temporary directory created at {os.path.dirname(self.file_path)}.")
        except Exception as e:
            print(f"An error occurred while creating the temporary directory: {e}")