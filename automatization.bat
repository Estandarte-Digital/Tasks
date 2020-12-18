set USER=%username%

mkdir C:\Users\%USER%\PycharmProjects\
mkdir C:\Users\%USER%\outputs\
cd C:\Users\%USER%\PycharmProjects\

git clone https://github.com/Estandarte-Digital/Tasks
git clone https://github.com/Estandarte-Digital/fusion_recognizers

cd C:\Users\%USER%\PycharmProjects\fusion_recognizers
cd expression_recognition
git submodule init
git submodule update
cd ..
cd pose_estimation
git submodule init
git submodule update

cd C:\Users\%USER%\PycharmProjects

schtasks /create /tn Pontelo /tr C:\Users\%USER%\PycharmProjects\Tasks\fusion.bat /sc daily /st 09:00 /rl HIGHEST
schtasks /create /tn Unity /tr "C:\Users\%USER%\Documents\EDBuild03\EstandarteDigitalP - Shortcut.lnk" /sc daily /st 09:00 /rl HIGHEST

cd Tasks
conda env create -f environment.yml
call conda estandarte
pip install -r requirements.txt