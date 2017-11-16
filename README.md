![效果展示图](https://github.com/hqwsun/img-folder/blob/master/KeyBoardTextField/123.gif)

### HWKeyboardTextField
输入文本框可以说是常用到的控件，许多人经常是直接在Controller添加通知和手势在做处理。
HWKeyboardTextField 考虑到开发效率和优化代码，将这些处理进行二次封装，实现一行代码解决这些问题。

```javascript
 // target 当输入框被键盘遮盖的时候需要去移动的view。
 // 注：如果不需要处理键盘遮盖问题，可不添加该方法直接使用。
  - (void)adaptView:(UIView *)target;
```

可适用各种界面，如scrollView，tableView甚至嵌套叠加界面，并用runtime为textView添加类别一个placeHold属性(UITextView 无法直接使用)。
代码已上传是github——[HWKeyboardTextField](https://github.com/hqwsun/HWKeyboardTextField)

### 结束语
喜欢的可以给个星哈！！！
