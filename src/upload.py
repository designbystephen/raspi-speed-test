# from __future__ import print_function
# import pickle
# import os.path
# from googleapiclient.discovery import build
# from google_auth_oauthlib.flow import InstalledAppFlow
# from google.auth.transport.requests import Request
from googleapiclient.http import MediaFileUpload
import service

def sendToGoogleDrive(path, mimetype, meta):
    """ Send file to Google Drive and return id of file if successful 
    """

    fileId = None

    try:
        # Create Google Drive service for uploading files
        driveService = service.createDriveService([
            'https://www.googleapis.com/auth/drive',
        ])

        media = MediaFileUpload(path, mimetype=mimetype)

        file = driveService.files().create(
            body=meta,
            media_body=media,
            fields='id',
        ).execute()

        fileId = file.get('id')

        print('Created file {} on Google Drive'.format(fileId))
    except Exception as e:
        print('Unable to send file to Google Drive. {}'.format(str(e)))

    return fileId
