package cn.oneayst.mapper;

import cn.oneayst.model.MaterialModel;
import cn.oneayst.model.MaterialSpModel;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MaterialMapper {

    String getMaterialNameById(@Param("materialId") long materialId) throws Exception;

    List<MaterialModel> queryMaterial(@Param("moduleId") long moduleId) throws Exception;

    List<MaterialSpModel> queryMaterialForPreview(@Param("moduleId") long moduleId) throws Exception;

    void deleteMaterial(@Param("materialId") long materialId) throws Exception;

    void deleteMaterialByModuleId(@Param("moduleId") long moduleId) throws Exception;

    void updateMaterial(MaterialModel material) throws Exception;

    void createMaterial(MaterialModel material) throws Exception;
}
