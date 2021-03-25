import xml.etree.ElementTree as ET
from xml.dom import minidom
import glob
import os
import platform

encoding = "utf-16"
ns = "http://schemas.microsoft.com/windows/2004/02/mit/task"
initialPath = f".//{{{ns}}}"
files = glob.glob("./originales/*.xml")

usr = os.getlogin()
desktop = platform.node()

ET.register_namespace("", ns)

for file in files:
    xml = ET.parse(file)
    root = xml.getroot()

    node = root.find(f"{initialPath}Command")
    newRoute = node.text.replace("ED01", usr)
    node.text = newRoute

    userIds = root.findall(f"{initialPath}UserId")
    if len(userIds) > 0:
        for userId in userIds:
            userId.text = f"{desktop}\\{usr}"

    xmlStr = minidom.parseString(ET.tostring(root, encoding)).toprettyxml()
    with open("./resultado/" + os.path.basename(file), "w+") as f:
        f.write(xmlStr)

print("Listo")