import { useState } from "react";

export default function App() {
  const [file, setFile] = useState(null);
  const [conversion, setConversion] = useState("html-to-pdf");
  const [downloadUrl, setDownloadUrl] = useState("");
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState("");

  const handleFileChange = (event: any) => {
    setFile(event.target.files[0]);
  };

  const handleConversionChange = (event: any) => {
    setConversion(event.target.value);
  };

  const handleSubmit = async (event: any) => {
    event.preventDefault();
    if (!file) {
      setError("Please select a file to convert.");
      return;
    }

    setLoading(true);
    setError("");

    const formData = new FormData();
    formData.append("file", file);
    formData.append("conversion", conversion);

    try {
      const response = await fetch(import.meta.env.BACKEND_API_URL, {
        method: "POST",
        body: formData,
      });

      if (!response.ok) {
        throw new Error("Conversion failed.");
      }

      const blob = await response.blob();
      const url = URL.createObjectURL(blob);
      setDownloadUrl(url);
    } catch (error: any) {
      setError(error.message);
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="p-4 max-w-md mx-auto border rounded shadow">
      <h2 className="text-xl font-bold mb-4">File Converter</h2>
      <form onSubmit={handleSubmit} className="space-y-4">
        <input type="file" onChange={handleFileChange} className="block w-full" />
        <select value={conversion} onChange={handleConversionChange} className="block w-full">
          <option value="html-to-pdf">HTML to PDF</option>
        </select>
        <button type="submit" disabled={loading} className="bg-blue-500 text-white px-4 py-2 rounded">
          {loading ? "Converting..." : "Convert"}
        </button>
      </form>
      {error && <p className="text-red-500 mt-2">{error}</p>}
      {downloadUrl && (
        <a href={downloadUrl} download="converted.pdf" className="block mt-4 text-blue-600 underline">
          Download Converted File
        </a>
      )}
    </div>
  );
}
