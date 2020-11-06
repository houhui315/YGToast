# YGToast
封装的简单toast,可以弹文本,图片,任意自定义要展示的信息
要弹出一个文本：
[[YGToastCenter defaultCenter] postAlertWithMessage:@"hello world!"];

要弹出一个自定义的view,要继承于 YGToastView 类，然后和弹出
YGMessageToastView *messageToast = [[YGMessageToastView alloc] initWithFrame:CGRectMake(0, 0, 252, 20) message:message];
[[YGToastCenter defaultCenter] showToastView:messageToast];

可以自定义弹出的时间
YGMessageToastView *messageToast = [[YGMessageToastView alloc] initWithFrame:CGRectMake(0, 0, 252, 20) message:message];
messageToast.showDuration = 3;
[[YGToastCenter defaultCenter] showToastView:messageToast];

可以放在自己封装的网络请求中，对服务器返回的message进行弹出，里面限制了同样文本内容一秒内只允许弹出一次。
