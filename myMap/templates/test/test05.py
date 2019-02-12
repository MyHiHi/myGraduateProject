from PyQt5 import (QtCore, QtGui, QtWidgets)
from PyQt5.QtWidgets import (QWidget, QLabel,QGridLayout,QLineEdit,QMainWindow,QMessageBox,
    QComboBox, QApplication)
from PyQt5.QtGui import QIcon,QColor
from PyQt5.QtCore import Qt
import sys
import sys
from test001 import thunder2Real
class MyDown(QWidget):
    def __init__(self):
        super().__init__()
        self.setUI(self)
    def setUI(self,Form):
        Form.setObjectName("Form")
        Form.resize(447, 338)
        Form.setWindowIcon(QIcon('cat.ico'))
        self.label_1 = QtWidgets.QLabel("输入迅雷链接",Form)
        self.label_1.setObjectName("tip_1")
        self.label_1.setGeometry(QtCore.QRect(10,100,90,30))
        self.textEdit_1 = QtWidgets.QLineEdit(Form)
        self.textEdit_1.setObjectName("url_1")
        self.textEdit_1.setGeometry(QtCore.QRect(100,100,300,30))
        self.textEdit_1.setEnabled(True)
        self.button_1 = QtWidgets.QPushButton("转换",Form)
        self.button_1.setObjectName("trans_1")
        self.button_1_width = self.label_1.width()+\
                              (self.textEdit_1.width()-self.label_1.width())/2
        self.button_1_height = self.label_1.height()+200
        self.button_1.setGeometry(QtCore.QRect(self.button_1_width,self.button_1_height,60,40))
        self.button_1.clicked.connect(self.transNow)
        self.textEdit_2 = QtWidgets.QLineEdit(self)
        self.textEdit_2.setObjectName("url_1")
        self.textEdit_2.setGeometry(QtCore.QRect(50, 300, 300, 30))
        self.textEdit_2.setEnabled(True)
        QtCore.QMetaObject.connectSlotsByName(Form)
        Form.setFixedSize(Form.width(), Form.height())
        Form.show()

    def transNow(self,Form):
        print("P")
        text_str = self.textEdit_1.text() or ""
        # print(text_str)
        try:
            if text_str == "":
                reply = QMessageBox.question(self, 'Message',
                                             "Please correctly input url !",
                                             QMessageBox.Yes | QMessageBox.No,
                                             QMessageBox.Yes)
            else:
                self.textEdit_2.setText("xxx")
                self.textEdit_2.setText(thunder2Real(text_str))
                    # text() =thunder2Real(text_str)
                print("ok")
        except Exception as e:
            print("ERRRRRO",e)

if __name__ == '__main__':

    app = QApplication(sys.argv)
    ex = MyDown()
    sys.exit(app.exec_())










