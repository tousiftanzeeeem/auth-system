from fastapi import FastAPI


app = FastAPI()



# Basic health check endpoint
@app.get("/auth")
def health_check():
    return {"status": "ok\n"}

# it's working 
if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=int(os.environ.get("PORT", 8000)))
