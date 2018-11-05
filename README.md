# jsp-mall
大概学了下jsp，写个简易商城试试(ノ｀Д)ノ(并不想写^_^)

# 构思的功能
1、首页商品展示<br>
2、首页头部可登录注册<br>
3、登录后，可以看到自己访问过的商品<br>
4、加个自动登录功能好了，账号密码保存1天<br>

# 涉及到的页面
1、商城首页<br>
2、登录注册页<br>
3、历史记录页<br>

# 会涉及到的知识点
1、商品和用户数据放数据库里得JDBC吧，数据库就用mySQL<br>
2、自动登录的账号密码信息、访问记录存在Cookie里<br>

# 进度Mark
## 2018.11.2
完成首页商品列表的展示、完成登录功能<br>
接下来对登录功能进一步完善：<br>
√1、登录失败时在登录界面上显示失败；<br>
在重定向前利用JOptionPane.showMessageDialog，要import包javax.swing.*<br>
√2、登录成功后+退出登录功能；<br>
退出登录=销毁session:session.removeAttribute<br>
3、+记住我功能（让用户在10天内可以自动登录）。<br>


# 真实遇到的知识点
1、静态代码块负责加载驱动？<br>
2、单例模式？<br>
3、PreparedStatement stmt = null;//语句对象<br>
		ResultSet rs = null;//数据集<br>
		这些是啥<br>
4、
