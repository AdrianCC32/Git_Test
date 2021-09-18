from pyhunter import PyHunter
import getpass
import sys
import requests


def manejar_respuesta(data):
    emails1 = []
    try:
        for email in data['emails']:
            print("\n[*]Email: " + str(email['value']))
            emails1.append(str(email['value']))
    except Exception as excp:
        print("Error, no info" + str(excp))
        emails1 = "error"
    return emails1


def busqueda_emails():
    organizacion = input("Ingrese Organizacion de la cual quiere buscar emails: ")
    limite = input("Limite: ")
    datos = hunter.domain_search(company=organizacion, limit=limite)
    manejar_respuesta(datos)


def busqueda_emails_compleja():
    organizacion = input("Ingrese Organizacion de la cual quiere buscar emails: ")
    name = input("Nombre Completo: ")
    datos = hunter.email_finder(company=organizacion, full_name=name, raw=True)
    print(datos)


def verificador_emails():
    email = input("Ingrese Email a verificar")
    resultado = hunter.email_verifier(email=email)
    print(resultado)


def contador_emails():
    organizacion = input("Ingrese Organizacion de la cual quiere buscar emails: ")
    resultado = hunter.email_count(company=organizacion)
    print(resultado)


def account_checker():
    resultado = hunter.account_information()
    print(resultado)


def menu():
    ops = 0
    while ops != 6:
        print("Menu API HUNTER.IO")
        print("1)Busqueda de emails por dominio")
        print("2)Busqueda de emails por compañia y nombre")
        print("3)Verificador de Email")
        print("4)Contador de Emails")
        print("5)Account Checker")
        print("6)Salir")
        ops = int(input("Opcion: "))
        if ops == 1:
            busqueda_emails()
        elif ops == 2:
            busqueda_emails_compleja()
        elif ops == 3:
            verificador_emails()
        elif ops == 4:
            contador_emails()
        elif ops == 5:
            account_checker()
        elif ops == 6:
            exit()


if __name__ == "__main__":
    print("Script para buscar información")
    apikey = input("Ingresa tu API key: ")
    hunter = PyHunter(apikey)
    menu()
