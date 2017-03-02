package com.zwl.dao;

import com.zwl.entity.ProblemSort;

import java.util.List;

/**
 * author zwl
 * create Date 2016/12/14
 */
public interface IProblemSortDao {

   void save(ProblemSort problemSort);

   List<ProblemSort> findAll();

   List<ProblemSort> PageFindSort(int start, int end);
}
