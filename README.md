### 前言
在iOS项目开发过程中，经常会遇到一些问题。当你在查看别人的项目或是自己的，有时候看到的是几千行的代码，说实话光是理解代码就够呛！！
身为开发团队的一员应该对自己和别人负责。那么就该考虑一些技巧。。。
* 如何去提高项目开展效率
* 怎样优化代码可读性
* 减少冗余的代码操作

### HWKeyboardTextField
对于输入文本框可以说是基本常用到的控件，
但是系统自带控件UITextView和UITextField并没有对弹出键盘和遮盖等一系列操作进行封装。
HWKeyboardTextField通过一些简单的封装，继承HWTextField和HWTextView，一行代码实现键盘遮盖问题解决：


```javascript
  //target 当输入框别键盘遮盖的时候需要去移动的view
  - (void)adaptView:(UIView *)target;
```

可适用各种界面，如scrollView，tableView甚至嵌套叠加界面，并用runtime为textView添加类别一个placeHold属性(UITextField自带不直接调用)。

### 结束语
该控件封装东西易懂也不多，建议阅读后自己扩展，可以自行参考！
