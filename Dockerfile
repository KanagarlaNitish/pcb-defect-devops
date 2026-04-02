FROM python:3.10

WORKDIR /app

COPY . .

RUN pip install --upgrade pip

# CPU torch
RUN pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cpu

# existing installs
RUN pip install flask pillow
RUN pip install ultralytics --no-cache-dir

# 👉 ADD THIS LINE
RUN pip install prometheus_client

EXPOSE 5000

CMD ["python", "app.py"]
