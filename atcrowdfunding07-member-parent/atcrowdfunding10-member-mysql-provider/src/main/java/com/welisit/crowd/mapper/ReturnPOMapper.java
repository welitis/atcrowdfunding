package com.welisit.crowd.mapper;

import com.welisit.crowd.entity.po.ReturnPO;
import com.welisit.crowd.entity.po.ReturnPOExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ReturnPOMapper {
    int countByExample(ReturnPOExample example);

    int deleteByExample(ReturnPOExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(ReturnPO record);

    int insertSelective(ReturnPO record);

    List<ReturnPO> selectByExample(ReturnPOExample example);

    ReturnPO selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") ReturnPO record, @Param("example") ReturnPOExample example);

    int updateByExample(@Param("record") ReturnPO record, @Param("example") ReturnPOExample example);

    int updateByPrimaryKeySelective(ReturnPO record);

    int updateByPrimaryKey(ReturnPO record);

	void insertReturnPOBatch(@Param("returnPOList")List<ReturnPO> returnPOList, @Param("projectId")Integer projectId);
}