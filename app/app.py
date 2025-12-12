from flask import Flask, jsonify
import os

app = Flask(__name__)

@app.route("/")
def index():
    return "Test CI-CD Flask app deployment"

@app.route("/health")
def health():
    return jsonify({"status": "ok"})

@app.route("/env")
def env():
    # For demo: return certain env vars
    return jsonify({
        "PORT": os.getenv("PORT"),
        "DATABASE_URL": os.getenv("DATABASE_URL"),
        "JWT_SECRET": os.getenv("JWT_SECRET")
    })

if __name__ == "__main__":
    port = int(os.getenv("PORT", "8080"))
    app.run(host="0.0.0.0", port=port)
