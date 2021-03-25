mkdir C:\Users\%username%\PycharmProjects\
mkdir C:\Users\%username%\PycharmProjects\EstandarteDigitalP\
mkdir C:\Users\%username%\outputs\
mkdir C:\Users\%username%\outputs\logs\
cd C:\Users\%username%\PycharmProjects\

git clone https://github.com/Estandarte-Digital/fusion_recognizers
git clone https://github.com/Estandarte-Digital/status_bot.git
git clone https://github.com/Estandarte-Digital/emotions_report.git

cd C:\Users\%username%\PycharmProjects\fusion_recognizers
git submodule init
git submodule update




cd C:\Users\%username%\PycharmProjects\Tasks
conda env create -f environment.yml
call conda estandarte
pip install -r requirements.txt