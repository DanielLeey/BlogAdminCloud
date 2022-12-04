package entity;

import java.util.Date;

import java.io.Serializable;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
/**
 * 后台用户角色表(SysRole)表实体类
 *
 * @author lee
 * @since 2022-12-04 17:57:39
 */
@SuppressWarnings("serial")
@Data
@AllArgsConstructor
@NoArgsConstructor
@TableName("sys_role")
public class SysRole  {
    @TableId
    private Long uid;

    //创建时间
    private Date createTime;
    //启用状态：0->禁用；1->启用
    private Integer status;
    //名称
    private String roleName;
    //修改时间
    private Date updateTime;
    //描述
    private String summary;



}
