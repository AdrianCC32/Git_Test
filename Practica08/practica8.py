from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
import smtplib
import subprocess


def enviarcorreo(de, para, asunto, clave, mensaje):
    msg = MIMEMultipart()
    message = mensaje  # mensaje a enviar
    password = clave  # password del correo
    msg['From'] = de  # quien envia el correo
    msg['To'] = para  # hacia quien va el correo
    msg['Subject'] = asunto  # el asunto del correo

    msg.attach(MIMEText(message, 'plain'))
    server = smtplib.SMTP('smtp.gmail.com: 587')
    server.starttls()
    server.login(msg['From'], password)
    server.sendmail(msg['From'], msg['To'].split(","), msg.as_string())
    server.quit()


de = "prograenviocorreo@gmail.com",
para = "adrian.cortezcs@uanl.edu.mx",
asunto = "Correo Automatizado",
clave = "enviocorreos.py"
mensaje = """Correo enviado automaticamente, operacion BASH
realizada con exito."""


result = subprocess.Popen("./bashscript.sh")
text = result.communicate()[0]
return_code = result.returncode

if return_code == 0:
    enviarcorreo(de, para, asunto, clave, mensaje)
    print("Correo enviado")
else:
    print("No se enviara el correo, hubo un error con la ejecucion"
          " del script bash")
