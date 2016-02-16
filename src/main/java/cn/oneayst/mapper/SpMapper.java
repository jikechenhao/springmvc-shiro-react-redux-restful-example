package cn.oneayst.mapper;

import cn.oneayst.model.SpModel;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SpMapper {
    List<SpModel> querySp(@Param("materialId") long materialId) throws Exception;

    void deleteSp(@Param("spId") long spId) throws Exception;

    void deleteSpByModuleId(@Param("moduleId") long moduleId) throws Exception;

    void updateSp(SpModel sp) throws Exception;

    void createSp(SpModel sp) throws Exception;

    void batchCreateSp(@Param("materialId") long materialId, @Param("spList") List<SpModel> spList) throws Exception;

    String getSpNameById(@Param("spId") long spId) throws Exception;
}
