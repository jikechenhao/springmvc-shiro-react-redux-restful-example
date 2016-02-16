package cn.oneayst.mapper;

import cn.oneayst.model.BrandModel;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BrandMapper {
    BrandModel getBrandByName(@Param("brandName") String brandName, @Param("projectId") Long projectId) throws Exception;

    String getBrandNameById(@Param("brandId") long brandId) throws Exception;

    List<BrandModel> queryBrand(@Param("projectId") long projectId) throws Exception;

    void deleteBrand(@Param("brandId") long brandId) throws Exception;

    void deleteBrandByProjectId(@Param("projectId") long projectId) throws Exception;

    void createBrand(BrandModel brand) throws Exception;

    void updateBrand(BrandModel brand) throws Exception;
}
