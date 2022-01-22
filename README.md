# Android手机助手PC端

### 设备搜索实现
原理：通过Udp广播实现，同一局域网设备将接收到服务端广播，并响应服务端消息，即完成了一次搜索。

过程：

1）搜索端发起广播Udp消息，并携带指定消息体，表示搜索指令

2）接收端监听同样Udp端口，收到该指令时，回传特定消息给搜索端

3）以上过程即完成了一次通信，搜索端将对应设备信息存入到设备列表中

约定：

端口：20000

搜索指令：search#{randomStr1}#name#ip

响应指令：search_msg_received#{randomStr2}#name#ip

其中，`{randomStr1}`与`{randomStr2}`为约定随机字符串，用于防止模拟请求，干扰搜索功能。目前，防干扰级别低，先考虑
简单实现。

`randomStr1`：a2w0nuNyiD6vYogF
`randomStr2`: RBIDoKFHLX9frYTh