set USER=%username%

mkdir C:\Users\%USER%\PycharmProjects\
cd C:\Users\%USER%\PycharmProjects\

git clone https://github.com/Estandarte-Digital/face-mask-detector.git
git clone https://github.com/Estandarte-Digital/ClimaInfo.git
git clone https://github.com/Estandarte-Digital/thermal-face.git
git clone https://github.com/Estandarte-Digital/Tasks

schtasks /create /tn Pontelo /tr C:\Users\%USER%\PycharmProjects\Tasks\pontelo.bat /sc onlogon /rl HIGHEST
schtasks /create /tn ClimaInfo /tr C:\Users\%USER%\PycharmProjects\Tasks\climainfor.bat /sc onlogon /rl HIGHEST
schtasks /create /tn EmotionRecognition /tr C:\Users\%USER%\PycharmProjects\Tasks\emotion_recognition0.bat /sc onlogon /rl HIGHEST
schtasks /create /tn Mask_Detector /tr C:\Users\%USER%\PycharmProjects\Tasks\mask_detector.bat /sc onlogon /rl HIGHEST
schtasks /create /tn Unity /tr "C:\Users\%USER%\Documents\EDBuild03\EstandarteDigitalP - Shortcut.lnk" /sc onlogon /rl HIGHEST

cd C:\Users\%USER%\PycharmProjects\ClimaInfo
npm install
cd ..
cd Tasks
conda env create -f environment.yml
call conda estandarte
pip install -r requirements.txt