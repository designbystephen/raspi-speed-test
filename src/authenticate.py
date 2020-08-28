import credentials

SCOPES = [
    'https://www.googleapis.com/auth/drive'
]

print('Clearing existing credentials')
credentials.clear()

print('Creating new credentials')
credentials.create(SCOPES)
