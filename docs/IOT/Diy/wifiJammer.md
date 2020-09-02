## **环境说明**

#### 准备工作

- Windows 10 1909 版本（Windows 系统）
- ESP8266 开发板(硬件)
- USB 数据线
- [开发工具(IDE)](https://www.arduino.cc/en/Main/Software)
- 驱动程序 PreInstaller

## **步骤说明**

**1.下载 arduino-1.8.9 并添加 badusb 库，打开 ArduinoIDE 后，点击文件-->首选项，开发板的管理器网址如下：**

```
http://digistump.com/package_digistump_index.json
```

![设置网址](../img/iot_img/bs1.png)

**2. 安装驱动程序，运行 PreInstaller.exe 程序，点击 Install 按钮**
![安装](../img/iot_img/wf1.png)

**3. 烧录程序**

- 3.1 运行 ESP8266Flasher.exe 程序，将开发板连接 USB 线并连接到电脑上，它会自动识别端口，如 COM3
  ![配置参数](../img/iot_img/wf2.png)

- 3.2 点击 Config 按钮，选择配置程序（ESP8266_Deauther_v2.0.5_1MB.bin）所在目录
  ![配置参数](../img/iot_img/wf3.png)

- 3.3 点击 Advanced 按钮，配置 Baudrate 和 Flash size 参数
  ![配置参数](../img/iot_img/wf4.png)

- 3.4 再次点击 Operation 按钮，点击 Flash 按钮
  ![配置参数](../img/iot_img/wf5.png)

**4. 配置管理程序**

- 4.1 将 USB 线从电脑拔下，再插入

- 4.2 打开网络连接，搜索名为 pwned 的 wifi,输入密码（deauther）点击连接

- 4.3 打开浏览器，在地址栏输入 192.168.4.1，进入配置页面

- 4.4 点击我已阅读此条款后，点击 Scan 菜单，再点击 SCAN APS(扫描)，若页面没有加载出扫描结果，再点击 Scan 菜单，最上面的 wifi 即为自己的 WiFi，点击勾选，即为选择要攻击哪个 WiFi

- 4.5 点击 Attacks 菜单，点击 Deauth 后面的 START 按钮
  （注意：若是 Beacon 攻击方式，需要先在 SSIDs 菜单中添加若干个 WiFi）

**5. 测试**

- 手机连接被攻击的 WiFi，看能不能上网，点击 stop 按钮后，可以正常上网

#### 注意事项
