FROM python:3.11-slim as builder

WORKDIR /app
COPY requirements.txt .
RUN python -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"
RUN pip install --no-cache-dir -r requirements.txt



# FROM python:3.11-slim (size 180MB)
#FROM gcr.io/distroless/python3-debian12:nonroot (size 127MB)

FROM gcr.io/distroless/python3-debian12:nonroot 

WORKDIR /app
COPY --from=builder /opt/venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"
ENV PYTHONPATH="/opt/venv/lib/python3.11/site-packages"

COPY . .

CMD ["-m","uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]