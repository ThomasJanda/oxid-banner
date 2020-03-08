<?php

namespace rs\banner\Application\Controller\Admin;


class ActionsMain extends ActionsMain_parent {

    public function render() 
    {
        $sType="cat";
        $sValue="";
        $this->_aViewData["cattree"] = $this->getCategoryList($sType, $sValue);
        return parent::render();
    }
    public function getCategoryList($sType, $sValue)
    {
        /** @var \OxidEsales\Eshop\Application\Model\CategoryList $oCatTree parent category tree */
        $oCatTree = oxNew(\OxidEsales\Eshop\Application\Model\CategoryList::class);
        $oCatTree->loadList();
        if ($sType === 'cat') {
            foreach ($oCatTree as $oCategory) {
                if ($oCategory->oxcategories__oxid->value == $sValue) {
                    $oCategory->selected = 1;
                    break;
                }
            }
        }

        return $oCatTree;
    }
    
}
