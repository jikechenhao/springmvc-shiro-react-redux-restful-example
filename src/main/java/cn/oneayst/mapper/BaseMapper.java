package cn.oneayst.mapper;

import cn.oneayst.model.RouteModel;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface BaseMapper {
    RouteModel getRoute(
            @Param("projectId") Long projectId,
            @Param("moduleId") Long moduleId,
            @Param("materialId") Long materialId)
            throws Exception;
}
