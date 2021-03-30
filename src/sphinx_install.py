import os
import subprocess
import datetime as dt
import time
home_dir = os.path.expanduser("~")


def install_requirements():
    pip_pkgs_required = os.path.join(os.getcwd(), 'src', 'requirements.txt')
    subprocess.run(['pip3', 'install', '-r', pip_pkgs_required])
    subprocess.run(['pip3', '--version'])


def set_theme(theme_name='sphinx_rtd_theme'):
    with open('source/conf.py', 'r') as file:
        file_text = file.read()
    file_text = file_text.replace('alabaster', theme_name)
    with open('source/conf.py', 'wt') as file:
        file.write(file_text)


def configure_sphinx():
    lines_to_add = ['\n\n', 'def setup(app):', '\n', '    app.add_stylesheet("css/custom.css")', '\n',
                    '    app.add_javascript("js/custom.js")', '\n']
    if os.path.exists('source/conf.py'):
        with open('source/conf.py', 'a') as config_file:
            config_file.write('\n')
            for line in lines_to_add:
                config_file.writelines(line)


def setup_sphinx():
    # http://sphinx-doc.org/
    docs_version = dt.datetime.today().strftime("%Y-%m-%d")
    docs_theme = 'sphinx_rtd_theme'
    sphinx_extensions = ['sphinx.ext.githubpages', 'sphinx.ext.graphviz', 'sphinxcontrib.nwdiag',
                         'sphinxcontrib.rackdiag', 'sphinxcontrib.packetdiag', 'sphinxcontrib.seqdiag',
                         'sphinxcontrib.blockdiag', 'sphinxcontrib.actdiag']
    extensions_string = ' '.join(sphinx_extensions)
    sphinx_params = ['sphinx-quickstart', '--project', 'knowledgebase', '--ext-autodoc', '--ext-todo', '-l', 'en',
                     '--ext-githubpages', '--sep', '--author', 'Patrick Brunswyck', '-v', docs_version, '-r', 'a',
                     '--extensions', extensions_string]
    try:
        if not os.path.exists('source/conf.py'):
            subprocess.run(sphinx_params)
            time.sleep(1)
            configure_sphinx()
        else:
            print("conf.py file already exist, delete it to reinstall sphinx")
    except ValueError:
        print("oops")


def main():
    install_requirements()
    setup_sphinx()
    set_theme()


if __name__ == '__main__':
    main()
