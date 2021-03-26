mkdir C:\Users\%username%\PycharmProjects\
mkdir C:\Users\%username%\PycharmProjects\EstandarteDigitalP\
mkdir C:\Users\%username%\outputs\
mkdir C:\Users\%username%\outputs\logs\

cd C:\Users\%username%\PycharmProjects\Tasks
git config --global user.name "Francisco González Hernández"
git config --global user.email "franciscogonzalez_hernandez@hotmail.com"
git config credential.helper store

git init
git remote add origin https://github.com/Estandarte-Digital/Tasks.git
git pull origin master --allow-unrelated-histories
git lfs install

start /wait gtk3-runtime-3.24.24-2021-01-30-ts-win64.exe

cd C:\Users\%username%\PycharmProjects\
git clone https://github.com/Estandarte-Digital/fusion_recognizers
git clone https://github.com/Estandarte-Digital/status_bot.git
git clone https://github.com/Estandarte-Digital/emotions_report.git

cd C:\Users\%username%\PycharmProjects\fusion_recognizers
git submodule init
git submodule update

cd C:\Users\%username%\PycharmProjects\Tasks\programacion_tareas
python adapt_xml.py
cd C:\Users\%username%\PycharmProjects\Tasks\programacion_tareas\resultado
schtasks /create /tn bot /xml bot.xml
schtasks /create /tn emotion_report /xml emotion_report.xml
schtasks /create /tn fusion /xml fusion.xml
schtasks /create /tn Unity /xml Unity.xml

cd C:\Users\%username%\PycharmProjects\Tasks
conda env create -f environment.yml
call conda estandarte
pip install -r requirements.txt