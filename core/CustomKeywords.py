import os

class CustomKeywords:
    def get_latest_downloaded_file(self, download_path):
        files = [os.path.join(download_path, f) for f in os.listdir(download_path)]
        return max(files, key=os.path.getctime) if files else None
