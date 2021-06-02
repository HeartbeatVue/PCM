package com.cqsd.service;

import com.cqsd.dao.PcUserMapper;
import com.cqsd.entity.PcUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Map;

@Service("pcUserService")
public class PcUserServiceImpl implements PcUserService {
    @Autowired
    private PcUserMapper pcUserMapper;

    @Override
    public List<PcUser> findUser(Map<String, Object> param) {
        if (param.get("page") == null || param.get("limit") == null) {
            throw new IllegalArgumentException("分页参数无效");
        }
        return pcUserMapper.findUser(param);
    }

    /**
     * 根据ID删除用户
     *
     * @param id 用户主键
     */
    @Override
    public void delUserId(Integer id) {
        if (id <= 0) {
            throw new IllegalArgumentException("ID参数无效");
        }
        pcUserMapper.delUserId(id);
    }

    /**
     * 添加用户数据
     *
     * @param user 用户所有信息
     */
    @Override
    public void saveUser(PcUser user) {
        if (user.getUsername() == null) {
            throw new IllegalArgumentException("用户名违规");
        }
        user.setPassword("123456789");
        user.setCreateDate(new Date());

        pcUserMapper.saveUser(user);
    }

    /**
     * 通过用户ID修改数据
     *
     * @param user 用户所有信息
     */
    @Override
    public void updateUser(PcUser user) {
        if (user.getId()==null){
            throw new IllegalArgumentException("用户ID违规");
        }
        pcUserMapper.updateUser(user);
    }
}
