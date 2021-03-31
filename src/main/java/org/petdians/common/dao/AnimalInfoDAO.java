package org.petdians.common.dao;

import org.petdians.animal.dto.MissingAnimalDTO;

import java.util.ArrayList;
import java.util.List;

public class AnimalInfoDAO {
    private static final List<MissingAnimalDTO> animalInfoDTOList = new ArrayList<>();

    public static void add(MissingAnimalDTO info){
        animalInfoDTOList.add(info);
    }

    public static List<MissingAnimalDTO> getList(){
        return animalInfoDTOList;
    }

    public static void clear(){
        animalInfoDTOList.clear();
    }
}
