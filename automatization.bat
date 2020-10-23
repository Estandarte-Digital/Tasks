set USER=%username%

mkdir C:\Users\%USER%\PycharmProjects\
cd C:\Users\%USER%\PycharmProjects\

git clone https://github.com/Estandarte-Digital/face-mask-detector.git
git clone https://github.com/Estandarte-Digital/ClimaInfo.git
git clone https://github.com/Estandarte-Digital/thermal-face.git
git clone https://github.com/Estandarte-Digital/Tasks
git clone https://github.com/Estandarte-Digital/HandGestureRecognition.git


schtasks /create /tn Pontelo /tr C:\Users\%USER%\PycharmProjects\Tasks\pontelo.bat /sc daily /st 09:00 /rl HIGHEST
schtasks /create /tn ClimaInfo /tr C:\Users\%USER%\PycharmProjects\Tasks\climainfor.bat /sc daily /st 09:00 /rl HIGHEST
schtasks /create /tn EmotionRecognition /tr C:\Users\%USER%\PycharmProjects\Tasks\emotion_recognition0.bat /sc daily /st 09:00 /rl HIGHEST
schtasks /create /tn Mask_Detector /tr C:\Users\%USER%\PycharmProjects\Tasks\mask_detector.bat /sc daily /st 09:00 /rl HIGHEST
schtasks /create /tn Unity /tr "C:\Users\%USER%\Documents\EDBuild03\EstandarteDigitalP - Shortcut.lnk" /sc daily /st 09:00 /rl HIGHEST
schtasks /create /tn KillProcesses /tr C:\Users\%USER%\PycharmProjects\Tasks\kill_processes.bat /sc daily /st 21:00 /rl HIGHEST

cd C:\Users\%USER%\PycharmProjects\ClimaInfo
npm install
cd ..
cd Tasks
conda env create -f environment.yml
call conda estandarte
pip install -r requirements.txt