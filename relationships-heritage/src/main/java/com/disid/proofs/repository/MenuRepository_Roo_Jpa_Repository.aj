// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.disid.proofs.repository;

import com.disid.proofs.domain.CallOption;
import com.disid.proofs.domain.Menu;
import com.disid.proofs.repository.MenuRepository;
import com.disid.proofs.repository.MenuRepositoryCustom;
import io.springlets.data.jpa.repository.DetachableJpaRepository;
import org.springframework.transaction.annotation.Transactional;

privileged aspect MenuRepository_Roo_Jpa_Repository {
    
    declare parents: MenuRepository extends DetachableJpaRepository<Menu, Long>;
    
    declare parents: MenuRepository extends MenuRepositoryCustom;
    
    declare @type: MenuRepository: @Transactional(readOnly = true);
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param option9
     * @return Long
     */
    public abstract long MenuRepository.countByOption9(CallOption option9);
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param option7
     * @return Long
     */
    public abstract long MenuRepository.countByOption7(CallOption option7);
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param option8
     * @return Long
     */
    public abstract long MenuRepository.countByOption8(CallOption option8);
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param option5
     * @return Long
     */
    public abstract long MenuRepository.countByOption5(CallOption option5);
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param option1
     * @return Long
     */
    public abstract long MenuRepository.countByOption1(CallOption option1);
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param option6
     * @return Long
     */
    public abstract long MenuRepository.countByOption6(CallOption option6);
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param option3
     * @return Long
     */
    public abstract long MenuRepository.countByOption3(CallOption option3);
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param option4
     * @return Long
     */
    public abstract long MenuRepository.countByOption4(CallOption option4);
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param option2
     * @return Long
     */
    public abstract long MenuRepository.countByOption2(CallOption option2);
    
}
