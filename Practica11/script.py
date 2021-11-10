import requests


def noticias():
    document = r"./htmlbruto.txt"
    with open(document, 'w', errors="ignore") as f:
        r = requests.get(URL)
        f.write(r.text)

URL = "https://www.welivesecurity.com/la-es/"

noticias()
