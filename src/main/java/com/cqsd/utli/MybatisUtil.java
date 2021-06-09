package com.cqsd.utli;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;

/*
 *mybatis工具类
 */
public class MybatisUtil {
    //静态方法
    public static SqlSession getSqlSession() throws IOException {
        //加载配置文件
        InputStream config = Resources.getResourceAsStream("mybatis-config.xml");
        //获取sql会话工厂实例
        SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(config);
//        SqlSession session = MybatisUtil.getSqlSession();
        //打开sql会话
//        SqlSession session = factory.openSession();
        return factory.openSession();
        //返回session
//        return session;
//        SqlSession session = MybatisUtil.getSqlSession();
        

    }


}
