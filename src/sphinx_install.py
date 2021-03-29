import os
import subprocess
home_dir = os.path.expanduser("~")

subprocess.run(['git', 'status'])
