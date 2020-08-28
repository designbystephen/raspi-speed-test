import credentials
from googleapiclient.discovery import build

def createDriveService(scopes):
    """Fetches credentials and creates a service used for Google Drive
    """
    driveService = None

    try:
        creds = credentials.create(scopes)
        driveService = build('drive', 'v3', credentials=creds)
    except Exception as e:
        print('Unable to create Google Drive Service. {}', str(e))
    
    return driveService