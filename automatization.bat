mkdir C:\Users\%username%\PycharmProjects\
mkdir C:\Users\%username%\outputs\
mkdir C:\Users\%username%\outputs\logs\
cd C:\Users\%username%\PycharmProjects\

git clone https://github.com/Estandarte-Digital/fusion_recognizers
git clone https://github.com/Estandarte-Digital/status_bot.git
git clone https://github.com/Estandarte-Digital/emotions_report.git

cd C:\Users\%username%\PycharmProjects\fusion_recognizers
git submodule init
git submodule update


schtasks /create /tn fusion /tr C:\Users\%username%\PycharmProjects\Tasks\fusion.bat /sc daily /st 08:55 /rl HIGHEST
schtasks /create /tn Unity /tr "C:\Users\%username%\PycharmProjects\EstandarteDigitalP\EstandarteDigitalP.exe" /sc daily /st 09:00 /rl HIGHEST
schtasks /create /tn bot /tr C:\Users\%username%\PycharmProjects\Tasks\status_bot.bat /sc daily /st 09:00 /rl HIGHEST
schtasks /create /tn taskkill /tr C:\Users\%username%\PycharmProjects\Tasks\kill_processes.bat /sc daily /st 21:00 /rl HIGHEST
schtasks /create /tn emotion_report /tr C:\Users\%username%\PycharmProjects\Tasks\emotions_report.bat /sc daily /st 21:05 /rl HIGHEST


cd C:\Users\%username%\PycharmProjects\Tasks
conda env create -f environment.yml
call conda estandarte
pip install -r requirements.txt