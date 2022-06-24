from flask import Flask
import os

app = Flask(__name__)

@app.route("/")
def success():
    return "Nice work, you're running Python within Docker!"


if __name__ == "__main__":
    port = int(os.environ.get("PORT", 3006))
    app.run(debug=True, host='0.0.0.0', port=port)
