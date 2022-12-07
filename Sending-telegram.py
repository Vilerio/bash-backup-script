import requests
import datetime
from datetime import date, time, datetime
TOKEN = "TOKENMAGIQUE"
chat_id = "IDMAGIQUE"
date = (datetime.now().strftime('%d-%m-%Y'))
heure=datetime.time(datetime.now())
message = f"Sauvegarde du {date} effectuée sur hostnamemagique à {heure}"
url = f"https://api.telegram.org/bot{TOKEN}/sendMessage?chat_id={chat_id}&text={message}"
print(requests.get(url).json()) # this sends the message
