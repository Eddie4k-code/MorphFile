from typing import Union

import os 
from fastapi import FastAPI

app = FastAPI()

from converters.ConverterFactory import ConverterFactory
from fastapi.responses import FileResponse
from fastapi import File, UploadFile
from fastapi.middleware.cors import CORSMiddleware




origins = [
    "https://frontend-morphfile.onrender.com"
]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)




@app.post("/convert")
async def convertf(file: UploadFile = File(...), conversion: str = "html-to-pdf"):
    """
    Endpoint to convert files based on the specified conversion type.

    :param conversion: The type of conversion to perform (e.g., 'html-to-pdf').
    :param file: The HTML file to be converted.
    :return: FileResponse with the converted file or an error message.
    """
    name = file.filename
    file_content = await file.read()
    
    # Ensure the temp directory exists
    os.makedirs(os.path.join(os.getcwd(), 'temp'), exist_ok=True)

    converter = ConverterFactory.create_converter(conversion)


    with open(os.getcwd() + '/temp/' + name, 'wb') as temp_file:
        temp_file.write(file_content)

    pdf_path = converter.convert(name, name)

   
    
    if pdf_path:
        return FileResponse(pdf_path, media_type='application/pdf', filename="converted.pdf")
    else:
        return {"error": "Conversion failed."}


