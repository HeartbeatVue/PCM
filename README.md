# PCM
##### 这是一个练习项目
### 该项目使用maven作为管理工具 
**需要使用mvn compile构建一次**

使用前需要创建一个[sql数据库](pcm.sql)

***

> 1.数据库版本在8.x以上可以忽略此条

> 2.数据库版本是5.x的需要在[这里](opm.xml)搜索mysql关键字启用5.x的连接器并注释掉8.x的连接器

在使用之前还需要一个数据库配置文件，需要在[目录](web/config)下创建一个叫db.properties的文件，代码如下


注： 5.x 版本数据库需要把cj删除
```properties
jdbc.driverClassName=com.mysql.cj.jdbc.Driver
jdbc.url=jdbc:mysql://localhost/pcm
jdbc.username=user
jdbc.password=Password
jdbc.maxTotal=20
jdbc.initialSize=5
jdbc.maxIdle=5
```




