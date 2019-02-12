from PyQt5 import (QtCore, QtGui, QtWidgets)
from PyQt5.QtWidgets import (QWidget, QLabel,QGridLayout,QLineEdit,QMainWindow,QMessageBox,
    QComboBox, QApplication)
from PyQt5.QtGui import QIcon,QColor
from PyQt5.QtCore import Qt
import sys
from test001 import  getDaZheJson

class daZhe(QWidget):
    def __init__(self):
        super().__init__()
        self.setUI(self)
    def setUI(self,form):
        form.setWindowTitle("KANKAN")
        self.label_1 = QtWidgets.QLabel("输入关键字",form)
        width_1 = 20
        width_2 = 150
        height_1 = 100
        height_2 = 30
        self.label_1.setGeometry(QtCore.QRect(width_1,height_1,width_2,height_2))
        self.linetext_1 = QtWidgets.QLineEdit(form)
        self.linetext_1.setGeometry(QtCore.QRect(width_1+120,height_1,width_2,height_2))

        self.button_1 = QtWidgets.QPushButton("看看",form)
        self.button_1.setGeometry(QtCore.QRect(width_1,height_2+100,width_2,height_2))
        self.button_1.clicked.connect(self.kankan)

        self.text_1 = QtWidgets.QTextEdit(form)
        self.text_1.setGeometry(QtCore.QRect(width_1,height_1+100,width_2+400,height_2+250))
        QtCore.QMetaObject.connectSlotsByName(form)
        form.setFixedSize(form.width(), form.height())
        form.show()


    def kankan(self):
        keyword = self.linetext_1.text() or ""
        if keyword == "":
            reply = QMessageBox.question(self, 'Message',"Please correctly input keyword !",
                                             QMessageBox.Yes | QMessageBox.No,
                                             QMessageBox.Yes)
            self.setOne("")
        else:
            self.setOne(keyword)

    def setOne(self,keyword):
        if keyword == "":
            self.text_1.setHtml("")
            return
        data = getDaZheJson(keyword)
        _translate = QtCore.QCoreApplication.translate
        html = "<!DOCTYPE html><html lang='zh-CN'><head></head><body><table border='1' bordercolor='#FF9966'><tr><th>名字</th><td>价格</td></tr>"
        i=1
        for key in data:
            html = html + "<tr><td>" +str(i)+ str(key) + "</td><td>" + str(data[key]) + "</td></tr>"
            i+=1

        html = html + "</table></body></html>"
        self.text_1.setHtml(html)

if __name__ == "__main__":
    app = QApplication(sys.argv)
    dazhe = daZhe()
    sys.exit(app.exec_())
