# debian社区首页 网页

1. 一个网页，两个简单页面归并到首页，点击菜单进行切换 
2. 预计划自动更新debain新闻和安全通知
3. 不需要放在网站上的页面会归并到 *_temp* 文件夹中
4. `<a href="#">...</a>` 会导致页面刷新，显示效果为跳转到页面顶部，现在以 `<a href="javascript:;">...</a>` 来代替,可以显示链接效果，但是不会跳转, 并且设置样式为充满整个块级元素
5. 响应式布局，兼容大多数浏览设备分辨率，如果发现排版错误请通知我
6. All files are put in the src folder, and the html folder inside have no use for website, just ignore it.