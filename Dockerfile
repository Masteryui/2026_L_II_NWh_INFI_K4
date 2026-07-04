# Używamy oficjalnego obrazu Pythona
FROM python:3.9-slim

# Ustawiamy katalog roboczy wewnątrz kontenera
WORKDIR /app

# Kopiujemy plik z zależnościami i instalujemy je
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Kopiujemy resztę plików projektu do kontenera
COPY . .

# Wskazujemy port, na którym aplikacja będzie działać
EXPOSE 5000

# Komenda startowa (zakładając, że plik główny to main.py)
CMD ["python", "main.py"]