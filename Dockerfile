FROM python:3.10

WORKDIR /app

COPY . .

RUN pip install --upgrade pip

# CPU torch (already correct)
RUN pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cpu

# install remaining separately (safer)
RUN pip install flask pillow
RUN pip install ultralytics --no-cache-dir

EXPOSE 5000

CMD ["python", "app.py"]